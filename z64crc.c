// Based on uCON64's N64 checksum algorithm by Andreas Sterbenz

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

typedef uint32_t u32;
typedef uint8_t u8;

static const u32
CRC_SEEDS[] = {
    0,
    0xF8CA4DDC, // 6101
    0xF8CA4DDC, // 6102
    0xA3886759, // 6103
    0,
    0xDF26F436, // 6105
    0x1FEA617A  // 6106
};

const static u32
BOOTCODE_CRCS[] = {
    0,
    0x6170A4A1, // 6101
    0x90BB6CB5, // 6102
    0x0B050EE0, // 6103
    0,
    0x98BC2C86, // 6105
    0xACC8580A  // 6106
};

#define N_CRC (sizeof(CRC_SEEDS) / sizeof(CRC_SEEDS[0]))

// crc32 code via https://gist.github.com/notwa/5689243
// in turn via http://www.geocities.ws/malbrain/crc_c.html

static const u32 crc32_tbl[] = {
    0x00000000, 0x1DB71064, 0x3B6E20C8, 0x26D930AC,
    0x76DC4190, 0x6B6B51F4, 0x4DB26158, 0x5005713C,
    0xEDB88320, 0xF00F9344, 0xD6D6A3E8, 0xCB61B38C,
    0x9B64C2B0, 0x86D3D2D4, 0xA00AE278, 0xBDBDF21C
};

static inline u32
calc_crc32(u8 *ptr, int cnt, u32 crc) {
    while (cnt--) {
        crc = (crc >> 4) ^ crc32_tbl[(crc & 0xF) ^ (*ptr & 0xF)];
        crc = (crc >> 4) ^ crc32_tbl[(crc & 0xF) ^ (*(ptr++) >> 4)];
    }
    return crc;
}

static inline u32
ROL(u32 i, u32 b) {
    return (i << b) | (i >> (32 - b));
}

static inline u32
R4(u8 *b) {
    return 0x1000000 * b[0] + 0x10000 * b[1] + 0x100 * b[2] + b[3];
}

static inline u8*
W4(u8 *b, u32 x) {
    b[0] = (x >> 24) & 0xFF;
    b[1] = (x >> 16) & 0xFF;
    b[2] = (x >>  8) & 0xFF;
    b[3] = (x >>  0) & 0xFF;
    return b;
}

typedef struct {
    u32 crc1;
    u32 crc2;
} calc_crc_ret;

static inline calc_crc_ret
calc_crc(u8 *data, int bootcode, u8 *lookup) {
    calc_crc_ret ret = {};

    u32 seed = CRC_SEEDS[bootcode];
    u32 t1 = seed;
    u32 t2 = seed;
    u32 t3 = seed;
    u32 t4 = seed;
    u32 t5 = seed;
    u32 t6 = seed;

    for (size_t i = 0x1000; i < 0x101000; i += 4) {
        u32 d = R4(data + i);

        if (t6 + d < t6)
            t4++;

        t6 += d;

        t3 ^= d;

        u32 r = ROL(d, d & 0x1F);

        t5 += r;

        if (t2 > d)
            t2 ^= r;
        else
            t2 ^= t6 ^ d;

        if (bootcode == 5) {
            u32 o = i & 0xFF;
            t1 += R4(lookup + o) ^ d;
        } else {
            t1 += t5;
        }
    }

    if (bootcode == 3) {
        ret.crc1 = (t6 ^ t4) + t3;
        ret.crc2 = (t5 ^ t2) + t1;
    } else if (bootcode == 6) {
        ret.crc1 = t6 * t4 + t3;
        ret.crc2 = t5 * t2 + t1;
    } else {
        ret.crc1 = t6 ^ t4 ^ t3;
        ret.crc2 = t5 ^ t2 ^ t1;
    }

    return ret;
}

static int
crc_version(u8 *buf) {
    // returns negative on error
    // otherwise returns version index
    u32 bootsum = ~calc_crc32(buf + 0x40, 0x1000 - 0x40, ~0);

    if (bootsum == 0)
        return -1;

    for (int i = 0; i < N_CRC; i++)
        if (bootsum == BOOTCODE_CRCS[i])
            return i;

    return -1;
}

static int
fix_crc(u8 *buf) {
    // returns negative on error
    // otherwise returns version index
    // and modifies the buffer
    int bootcode = crc_version(buf);
    if (bootcode < 0)
        return bootcode;

    calc_crc_ret crcs = calc_crc(buf, bootcode, buf + 0x750);
    W4(buf + 0x10, crcs.crc1);
    W4(buf + 0x14, crcs.crc2);

    return bootcode;
}

int
main(int argc, char *argv[]) {
    // TODO: add stdin/stdout mode
    for (int i = 1; i < argc; i++) {
        FILE *f = fopen(argv[i], "rb");
        if (f == NULL) {
            perror(argv[1]);
            return 1;
        }

        fseek(f, 0, SEEK_END);
        size_t size = ftell(f);
        fseek(f, 0, SEEK_SET);

        if (size < 0x00101000 || size > 0x10000000) {
            fprintf(stderr, "Expected reasonable ROM size, got 0x%08X\n", (u32) size);
            fclose(f);
            return 2;
        }

        u8 *buf = malloc(size);
        fread(buf, 1, size, f);
        fclose(f);

        int bootcode = fix_crc(buf);
        if (bootcode < 0) {
            //fprintf(stderr, "Failed to fix CRC. Error %i\n", bootcode);
            fprintf(stderr, "Failed to fix CRC: unknown bootcode\n");
            free(buf);
            return bootcode;
        }

        f = fopen(argv[i], "wb");
        if (f == NULL) {
            perror(argv[1]);
            return 3;
        }

        fwrite(buf, size, 1, f);
        fclose(f);

        printf("%i\t%s\n", bootcode + 6100, argv[i]);

        free(buf);
    }

    return 0;
}
