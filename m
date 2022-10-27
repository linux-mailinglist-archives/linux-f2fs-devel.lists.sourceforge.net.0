Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC460EF93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 07:42:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onveh-0006NT-U7;
	Thu, 27 Oct 2022 05:42:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3-RNaYwwKAKoReKXQbKXNKVVQYYQVO.MYW@flex--huangrandall.bounces.google.com>)
 id 1onveg-0006NN-Si for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 05:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kZrV/1Wpi1+HqcfGR+b498M10ZLeStFwJCyAnig/6KY=; b=md+Rez203qgIe6kfqkZ1RHVAB1
 GWkuS+SFJU9xrWYgK/qI67K6mWIdiQsAq4UjEfsbmC1Sd5xqyA9iacxPrGkRWmepGMYTe6MG3fvDs
 gRQUEl5HkCvyRQyhJ/TVBDs9XW69tJp0wFgmK6L8dqA7RAmtEwU9vwmSNowavZqiGl9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kZrV/1Wpi1+HqcfGR+b498M10ZLeStFwJCyAnig/6KY=; b=m
 EBE3C5G+pleuO1dUzmTRL73fDsksC3QQC8H+5NxDmu/ebvpXh2/2Hiy7n0cF4pqN4BwKjXQXvTMID
 6UucmHc8VrSBvP4FChH1ZMSxBgtDSgbzMNpt/nQ9r7zKOikyoTp1kq4sYcFCWuhWVZs6QyA3869IW
 jEyMdurBeCdXY9oc=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1onvef-001Svz-Sv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 05:42:14 +0000
Received: by mail-yb1-f202.google.com with SMTP id
 204-20020a2510d5000000b006be7970889cso463172ybq.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Oct 2022 22:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kZrV/1Wpi1+HqcfGR+b498M10ZLeStFwJCyAnig/6KY=;
 b=Tx2lkoNOzNqsVk/vJbR0GpGaA48pFVNkUh4t+YEjnIbPng3xLxJy1j2YQw0Gcaq4Fz
 ZDGKKNYiSeFqCbO7iBko8QLzcMXyD77QSZXgFLkp7jvcFQRxckF2lv9K5x0Vh8aqRqSy
 Px49dQPvNnRUV3aFAcSu373Okxz4HwKER4kIoXokWDEhzfi3NuY74kW8XL/oeP9X0Q48
 DM00Q5oXLv+rjvyffH9rzBnUUvwW7pFD5siBSIU7dZTjX1WrFzWwtn1gN58rTUaCIZlH
 nykZKPku+bxK3e/Ymo4D0M3y/Z51VhjiY0RP2XME1ta6xvSjKxYRxb6CO4ahZnQfW7qH
 Borw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZrV/1Wpi1+HqcfGR+b498M10ZLeStFwJCyAnig/6KY=;
 b=3IxJ6ka47dL+n7K+d/X/4XknYQ8I+6ef4s4BMbZrLU+vCgGpRTAE4kIpqVw7w6q67R
 QFrERO7JtVWhoZqKyS9CWIthxnb3udbufLFEujdDMRNfJRKpGFOg0CT9XzTyJpbFpJpH
 L5tGTj3NUufhy1uLqQYO9Jx908nhaWhPmXRIYwZ1s87GREwBrF7mdBHSxcG4r08tpqsq
 70L/egdRfIaUK95uNDqZW+kRYKJVx6gQWdb30H0M0AbZrw1YNSfVQlMv78BypTUxg0E/
 jGnHPgtf0w9xEhhDW7QLdP0CK+fcVSiN7StmtghNASqOfvYmRYNYCj0DDVRgA+NaIjfW
 HjwQ==
X-Gm-Message-State: ACrzQf1um17fK2+d6FxVxDIElQkT+ft0bt02dys9eweLzeqeEuKEaYpx
 ZcgXvhUr1RawmVS51htQirP+SHgUIXz5BynnVcg=
X-Google-Smtp-Source: AMsMyM5Grn1I55wSTTMsiFvuPjOX1kB6QyFyWKcx5iVaHM4kFiMN/A8apf9ZlannAYtoWQ06OcCEzyTpp3mKNSxNuW0=
X-Received: from huangrandall-gl0.tao.corp.google.com
 ([2401:fa00:fd:203:334d:6a5:213c:f5a5])
 (user=huangrandall job=sendgmr) by 2002:a81:be17:0:b0:36f:ced5:b938 with SMTP
 id i23-20020a81be17000000b0036fced5b938mr0ywn.22.1666847737521; Wed, 26 Oct
 2022 22:15:37 -0700 (PDT)
Date: Thu, 27 Oct 2022 13:15:32 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221027051532.267913-1-huangrandall@google.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com, 
 linux-kernel@vger.kernel.org
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Support UFS error history dumping Signed-off-by: Randall
 Huang
 <huangrandall@google.com> --- tools/sg_write_buffer/Android.bp | 19 ++
 tools/sg_write_buffer/sg_read_buffer.c
 | 334 +++++++++++++++++++++++++ 2 files changed, 353 insertio [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1onvef-001Svz-Sv
Subject: [f2fs-dev] [PATCH] Introduce sg_read_buffer
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Randall Huang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Randall Huang <huangrandall@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support UFS error history dumping

Signed-off-by: Randall Huang <huangrandall@google.com>
---
 tools/sg_write_buffer/Android.bp       |  19 ++
 tools/sg_write_buffer/sg_read_buffer.c | 334 +++++++++++++++++++++++++
 2 files changed, 353 insertions(+)
 create mode 100644 tools/sg_write_buffer/sg_read_buffer.c

diff --git a/tools/sg_write_buffer/Android.bp b/tools/sg_write_buffer/Android.bp
index 5222a59..f488aea 100644
--- a/tools/sg_write_buffer/Android.bp
+++ b/tools/sg_write_buffer/Android.bp
@@ -25,3 +25,22 @@ cc_binary {
         "sg_pt_linux_nvme.c",
     ],
 }
+
+cc_binary {
+    name: "sg_read_buffer",
+    defaults: [ "sg3-utils-defaults" ],
+    srcs: [
+        "sg_read_buffer.c",
+        "sg_cmds_basic.c",
+        "sg_cmds_basic2.c",
+        "sg_cmds_extra.c",
+        "sg_cmds_mmc.c",
+        "sg_io_linux.c",
+        "sg_lib.c",
+        "sg_lib_data.c",
+        "sg_pt_common.c",
+        "sg_pt_linux.c",
+        "sg_pt_linux_nvme.c",
+    ],
+    system_ext_specific: true,
+}
diff --git a/tools/sg_write_buffer/sg_read_buffer.c b/tools/sg_write_buffer/sg_read_buffer.c
new file mode 100644
index 0000000..1924c7d
--- /dev/null
+++ b/tools/sg_write_buffer/sg_read_buffer.c
@@ -0,0 +1,334 @@
+/*
+ * Copyright (c) 2006-2013 Luben Tuikov and Douglas Gilbert.
+ * All rights reserved.
+ * Use of this source code is governed by a BSD-style
+ * license that can be found in the BSD_LICENSE file.
+ */
+
+#include <unistd.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <ctype.h>
+#include <string.h>
+#include <getopt.h>
+
+#ifdef HAVE_CONFIG_H
+#include "config.h"
+#endif
+#include "sg_lib.h"
+#include "sg_cmds_basic.h"
+#include "sg_cmds_extra.h"
+#include "sg_pt.h"      /* needed for scsi_pt_win32_direct() */
+
+/*
+ * This utility issues the SCSI READ BUFFER command to the given device.
+ */
+
+static const char * version_str = "1.09 20130507";
+
+
+static struct option long_options[] = {
+        {"help", 0, 0, 'h'},
+        {"hex", 0, 0, 'H'},
+        {"id", 1, 0, 'i'},
+        {"length", 1, 0, 'l'},
+        {"mode", 1, 0, 'm'},
+        {"offset", 1, 0, 'o'},
+        {"raw", 0, 0, 'r'},
+        {"verbose", 0, 0, 'v'},
+        {"version", 0, 0, 'V'},
+        {0, 0, 0, 0},
+};
+
+
+static void
+usage()
+{
+    fprintf(stderr, "Usage: "
+          "sg_read_buffer [--help] [--hex] [--id=ID] [--length=LEN] "
+          "[--mode=MO]\n"
+          "                      [--offset=OFF] [--raw] [--verbose] "
+          "[--version] DEVICE\n"
+          "  where:\n"
+          "    --help|-h           print out usage message\n"
+          "    --hex|-H            print output in hex\n"
+          "    --id=ID|-i ID       buffer identifier (0 (default) to 255)\n"
+          "    --length=LEN|-l LEN    length in bytes to read (def: 4)\n"
+          "    --mode=MO|-m MO     read buffer mode, MO is number or "
+          "acronym (def: 0)\n"
+          "    --off=OFF|-o OFF    buffer offset (unit: bytes, def: 0)\n"
+          "    --raw|-r            output response to stdout\n"
+          "    --verbose|-v        increase verbosity\n"
+          "    --version|-V        print version string and exit\n\n"
+          "  Numbers given in options are decimal unless they have a "
+          "hex indicator\n"
+          "Performs a SCSI READ BUFFER command\n"
+          );
+
+}
+
+#define MODE_HEADER_DATA        0
+#define MODE_VENDOR             1
+#define MODE_DATA               2
+#define MODE_DESCRIPTOR         3
+#define MODE_ECHO_BUFFER        0x0A
+#define MODE_ECHO_BDESC         0x0B
+#define MODE_EN_EX_ECHO         0x1A
+#define MODE_ERR_HISTORY        0x1C
+
+static struct mode_s {
+        const char *mode_string;
+        int   mode;
+        const char *comment;
+} modes[] = {
+        { "hd",         MODE_HEADER_DATA, "combined header and data"},
+        { "vendor",     MODE_VENDOR,    "vendor specific"},
+        { "data",       MODE_DATA,      "data"},
+        { "desc",       MODE_DESCRIPTOR, "descriptor"},
+        { "echo",       MODE_ECHO_BUFFER, "read data from echo buffer "
+          "(spc-2)"},
+        { "echo_desc",  MODE_ECHO_BDESC, "echo buffer descriptor (spc-2)"},
+        { "en_ex",      MODE_EN_EX_ECHO,
+          "enable expander communications protocol and echo buffer (spc-3)"},
+        { "err_hist",   MODE_ERR_HISTORY, "error history (spc-4)"},
+};
+
+#define NUM_MODES       ((int)(sizeof(modes)/sizeof(modes[0])))
+
+static void
+print_modes(void)
+{
+    int k;
+
+    fprintf(stderr, "The modes parameter argument can be numeric "
+                "(hex or decimal)\nor symbolic:\n");
+    for (k = 0; k < NUM_MODES; k++) {
+        fprintf(stderr, " %2d (0x%02x)  %-16s%s\n", modes[k].mode,
+                modes[k].mode, modes[k].mode_string, modes[k].comment);
+    }
+}
+
+static void
+dStrRaw(const char* str, int len)
+{
+    int k;
+
+    for (k = 0 ; k < len; ++k)
+        printf("%c", str[k]);
+}
+
+int
+main(int argc, char * argv[])
+{
+    int sg_fd, res, c, len, k;
+    int do_help = 0;
+    int do_hex = 0;
+    int rb_id = 0;
+    int rb_len = 4;
+    int rb_mode = 0;
+    int rb_offset = 0;
+    int do_raw = 0;
+    int verbose = 0;
+    const char * device_name = NULL;
+    unsigned char * resp;
+    int ret = 0;
+
+    while (1) {
+        int option_index = 0;
+
+        c = getopt_long(argc, argv, "hHi:l:m:o:rvV", long_options,
+                        &option_index);
+        if (c == -1)
+            break;
+
+        switch (c) {
+        case 'h':
+        case '?':
+            ++do_help;
+            break;
+        case 'H':
+            ++do_hex;
+            break;
+        case 'i':
+            rb_id = sg_get_num(optarg);
+            if ((rb_id < 0) || (rb_id > 255)) {
+                fprintf(stderr, "argument to '--id' should be in the range "
+                        "0 to 255\n");
+                return SG_LIB_SYNTAX_ERROR;
+            }
+            break;
+        case 'l':
+            rb_len = sg_get_num(optarg);
+            if (rb_len < 0) {
+                fprintf(stderr, "bad argument to '--length'\n");
+                return SG_LIB_SYNTAX_ERROR;
+             }
+             break;
+        case 'm':
+            if (isdigit(*optarg)) {
+                rb_mode = sg_get_num(optarg);
+                if ((rb_mode < 0) || (rb_mode > 31)) {
+                    fprintf(stderr, "argument to '--mode' should be in the "
+                            "range 0 to 31\n");
+                    return SG_LIB_SYNTAX_ERROR;
+                }
+            } else {
+                len = strlen(optarg);
+                for (k = 0; k < NUM_MODES; ++k) {
+                    if (0 == strncmp(modes[k].mode_string, optarg, len)) {
+                        rb_mode = modes[k].mode;
+                        break;
+                    }
+                }
+                if (NUM_MODES == k) {
+                    print_modes();
+                    return SG_LIB_SYNTAX_ERROR;
+                }
+            }
+            break;
+        case 'o':
+           rb_offset = sg_get_num(optarg);
+           if (rb_offset < 0) {
+                fprintf(stderr, "bad argument to '--offset'\n");
+                return SG_LIB_SYNTAX_ERROR;
+            }
+            break;
+        case 'r':
+            ++do_raw;
+            break;
+        case 'v':
+            ++verbose;
+            break;
+        case 'V':
+            fprintf(stderr, "version: %s\n", version_str);
+            return 0;
+        default:
+            fprintf(stderr, "unrecognised option code 0x%x ??\n", c);
+            usage();
+            return SG_LIB_SYNTAX_ERROR;
+        }
+    }
+    if (do_help) {
+        if (do_help > 1) {
+            usage();
+            fprintf(stderr, "\n");
+            print_modes();
+        } else
+            usage();
+        return 0;
+    }
+    if (optind < argc) {
+        if (NULL == device_name) {
+            device_name = argv[optind];
+            ++optind;
+        }
+        if (optind < argc) {
+            for (; optind < argc; ++optind)
+                fprintf(stderr, "Unexpected extra argument: %s\n",
+                        argv[optind]);
+            usage();
+            return SG_LIB_SYNTAX_ERROR;
+        }
+    }
+
+    if (NULL == device_name) {
+        fprintf(stderr, "missing device name!\n");
+        usage();
+        return SG_LIB_SYNTAX_ERROR;
+    }
+
+    if (rb_len > 0) {
+        resp = (unsigned char *)malloc(rb_len);
+        if (NULL == resp) {
+            fprintf(stderr, "unable to allocate %d bytes on the heap\n",
+                    rb_len);
+            return SG_LIB_CAT_OTHER;
+        }
+        memset(resp, 0, rb_len);
+    } else
+        resp = NULL;
+
+    if (do_raw) {
+        if (sg_set_binary_mode(STDOUT_FILENO) < 0) {
+            perror("sg_set_binary_mode");
+            return SG_LIB_FILE_ERROR;
+        }
+    }
+
+#ifdef SG_LIB_WIN32
+#ifdef SG_LIB_WIN32_DIRECT
+    if (verbose > 4)
+        fprintf(stderr, "Initial win32 SPT interface state: %s\n",
+                scsi_pt_win32_spt_state() ? "direct" : "indirect");
+    scsi_pt_win32_direct(SG_LIB_WIN32_DIRECT /* SPT pt interface */);
+#endif
+#endif
+
+    sg_fd = sg_cmds_open_device(device_name, 0 /* rw */, verbose);
+    if (sg_fd < 0) {
+        fprintf(stderr, "open error: %s: %s\n", device_name,
+                safe_strerror(-sg_fd));
+        return SG_LIB_FILE_ERROR;
+    }
+
+    res = sg_ll_read_buffer(sg_fd, rb_mode, rb_id, rb_offset, resp,
+                            rb_len, 1, verbose);
+    if (0 != res) {
+        ret = res;
+        switch (res) {
+        case SG_LIB_CAT_NOT_READY:
+            fprintf(stderr, "Read buffer failed, device not ready\n");
+            break;
+        case SG_LIB_CAT_UNIT_ATTENTION:
+            fprintf(stderr, "Read buffer not done, unit attention\n");
+            break;
+        case SG_LIB_CAT_ABORTED_COMMAND:
+            fprintf(stderr, "Read buffer, aborted command\n");
+            break;
+        case SG_LIB_CAT_INVALID_OP:
+            fprintf(stderr, "Read buffer command not supported\n");
+            break;
+        case SG_LIB_CAT_ILLEGAL_REQ:
+            fprintf(stderr, "bad field in Read buffer cdb\n");
+            break;
+        default:
+            fprintf(stderr, "Read buffer failed res=%d\n", res);
+            break;
+        }
+    } else if (rb_len > 0) {
+        if (do_raw)
+            dStrRaw((const char *)resp, rb_len);
+        else if (do_hex || (rb_len < 4))
+            dStrHex((const char *)resp, rb_len, ((do_hex > 1) ? 0 : 1));
+        else {
+            switch (rb_mode) {
+            case MODE_DESCRIPTOR:
+                k = (resp[1] << 16) | (resp[2] << 8) | resp[3];
+                printf("OFFSET BOUNDARY: %d, Buffer offset alignment: "
+                       "%d-byte\n", resp[0], (1 << resp[0]));
+                printf("BUFFER CAPACITY: %d (0x%x)\n", k, k);
+                break;
+            case MODE_ECHO_BDESC:
+                k = ((resp[2] & 0x1F) << 8) | resp[3];
+
+                printf("EBOS:%d\n", resp[0] & 1 ? 1 : 0);
+                printf("Echo buffer capacity: %d (0x%x)\n", k, k);
+                break;
+            default:
+                dStrHex((const char *)resp, rb_len, (verbose > 1 ? 0 : 1));
+                break;
+            }
+        }
+    }
+
+    if (resp)
+        free(resp);
+    res = sg_cmds_close_device(sg_fd);
+    if (res < 0) {
+        fprintf(stderr, "close error: %s\n", safe_strerror(-res));
+        if (0 == ret)
+            return SG_LIB_FILE_ERROR;
+    }
+    return (ret >= 0) ? ret : SG_LIB_CAT_OTHER;
+}
-- 
2.38.0.135.g90850a2211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
