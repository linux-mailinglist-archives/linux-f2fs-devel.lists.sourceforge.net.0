Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0FC50AB55
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8n-0007wZ-N3; Thu, 21 Apr 2022 22:19:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8m-0007wG-7x
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tKDEEADIYQVytDvYqKLcVedQjfgIjM2wttb1wHl0dTg=; b=JPEI9KMhvwwgS9IoZ2J3FmkL67
 a+erL3XW46etCp1+OwBPj3NX2NwEXI3LisYEqnPxB2c0iotvHbHWZtLVE08qj2jhkA20Eg873E19q
 vWy2ICWkrvcGLAa2HXbhQ4vXg8OTiuheZG+UmLPyR3QJXcg8q4OVy3HAF6So8HI8FJGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tKDEEADIYQVytDvYqKLcVedQjfgIjM2wttb1wHl0dTg=; b=J1yZc3sVgDK8b6YMDwy2l7C6zi
 ub3gHGhR8pTR90+7O/Bbd5p3mYVgW12Q7LyYuQ0Ujfnltk//cWv6rP3FaSZsYIwwJrGXH5d5iMkan
 Gw3VuO60hL99hd79jxZECs0U8DjmS/aPBIA0gCmLRyI3WifL0ivrrZvqUwcn3C8MDtG8=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8k-0002vJ-M3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:07 +0000
Received: by mail-pl1-f182.google.com with SMTP id q1so5595188plx.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tKDEEADIYQVytDvYqKLcVedQjfgIjM2wttb1wHl0dTg=;
 b=bbh22eM+GrG4rsbtgyUuDqoMHpuUphx7AX4Gf+ovlQZnrBh9g/B/qoB5gOqoNds9Ts
 8Rv6we8tMMHzczW7YAvPl2xBqSsMD7djcNB34lM7w1SrF4j0rVY5wRvH9rDP9vOS/Ts+
 bi5Q2ykaRWANvMbqkY+hfY4/lOqBP8s4fw7PHP2IYCJH2H+1Dp5PX89u30RgSscKa2T8
 160NbBwelWFzrgU7ZcznBguYd3VUTXnywXn/RhJRuv5MPS9alrRJK+KUAk/4inU2JHZ6
 Y1NjkBeoJ5Hv27r0NI6p4zIOH2BcQTLq3lVd0deg3goS8nYCB+A0SczUrh84gJRBFiMC
 50lg==
X-Gm-Message-State: AOAM531SiiwOwBmRhxySD919omvjHl1SrvEI9OhrFn44z2wBVdCPTtiO
 iaTpjAiX98swORnn2oknDk4Hi+M8gMP6qw==
X-Google-Smtp-Source: ABdhPJzGI31kx5LkWHDC3M/jGtUVBBNkfaJI/vxFwfqL8AK4v/58HzUYvLkscS1q8Jn+MD38/5+dbg==
X-Received: by 2002:a17:90b:3c47:b0:1cb:8121:dcc8 with SMTP id
 pm7-20020a17090b3c4700b001cb8121dcc8mr12898347pjb.35.1650579541005; 
 Thu, 21 Apr 2022 15:19:01 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:00 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:13 -0700
Message-Id: <20220421221836.3935616-9-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For those who use Github to contribute f2fs-tools patches,
 let the github servers build the f2fs-tools source code upon every push and
 pull requests. This change does not affect users who do not use G [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8k-0002vJ-M3
Subject: [f2fs-dev] [PATCH 08/31] ci: Build f2fstools upon push and pull
 requests
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For those who use Github to contribute f2fs-tools patches, let the
github servers build the f2fs-tools source code upon every push and pull
requests. This change does not affect users who do not use Github.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 .github/workflows/ci.yml | 70 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 .github/workflows/ci.yml

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
new file mode 100644
index 000000000000..0c774f92fac8
--- /dev/null
+++ b/.github/workflows/ci.yml
@@ -0,0 +1,70 @@
+# See also https://docs.github.com/en/actions/learn-github-actions/expressions
+# See also https://github.com/marketplace/actions/setup-android-ndk
+
+name: CI
+
+on: [push, pull_request]
+
+jobs:
+  build:
+    runs-on: ubuntu-latest
+    strategy:
+      fail-fast: false
+      matrix:
+        build:
+        - android
+        - linux-gcc
+        - linux-clang
+        - linux-x86-gcc
+        - linux-powerpc64-gcc
+        - linux-mingw64-gcc
+        - macos
+        include:
+        - build: android
+          cc: clang
+          host: aarch64-linux-android32
+        - build: linux-gcc
+          cc: gcc
+        - build: linux-clang
+          cc: clang
+        - build: linux-x86-gcc
+          cc: gcc
+          arch: x86
+        - build: linux-powerpc64-gcc
+          cc: gcc
+          host: powerpc64-linux-gnu
+        - build: linux-mingw64-gcc
+          cc: gcc
+          host: x86_64-w64-mingw32
+          cflags: -D__USE_MINGW_ANSI_STDIO
+        - build: macos
+          cc: clang
+          os: macos-latest
+    steps:
+      - uses: actions/checkout@v3
+      - name: Install Android NDK
+        run: |
+          if [ ${{matrix.build}} = android ]; then \
+              wget --quiet https://dl.google.com/android/repository/android-ndk-r24-linux.zip; \
+              unzip -q android-ndk-r24-linux.zip;  \
+          fi
+      - name: Install Ubuntu packages
+        run: |
+          sudo apt-get -q update
+          case "${{matrix.host}}" in                                        \
+            x86_64-w64-mingw32)                                             \
+              sudo apt-get -q install -y binutils-mingw-w64 gcc-mingw-w64;; \
+            powerpc64-linux-gnu)                                            \
+              sudo apt-get -q install -y binutils-powerpc64-linux-gnu       \
+              gcc-powerpc64-linux-gnu;;                                     \
+          esac
+      - name: Build
+        run: |
+          echo "HOST=${{matrix.host}}"
+          NDK=$PWD/android-ndk-r24/toolchains/llvm/prebuilt/linux-x86_64/bin
+          export PATH="$NDK:$PATH"
+          ./autogen.sh
+          ./configure --host=${{matrix.host}} \
+              CC=${{ matrix.host && format('{0}-{1}', matrix.host, matrix.cc) || matrix.cc }} \
+              CFLAGS="${{matrix.cflags}}"
+          make -j$(nproc)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
