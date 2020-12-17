Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 050AD2DD500
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 17:15:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpvw5-0004Wc-Gn; Thu, 17 Dec 2020 16:15:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kpvw3-0004W9-M6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FWcwQWRHez3gIHia6wDyGTXC4huvBrkLRyK3EXFiFkU=; b=HrALo1HJA1WpwoA7wDwePQKvZN
 ZgP8ffGUQAVBy73vTWMGbSOihcYAhHldcqDcgPNQ/vAJkpXw0LmsAj0T6M1O2qKeVgiupX6lmuVWQ
 SGU4umlkXWy7s/oj6vh+xgdGljXV9oRPUL24wrJVqgw1IUta2U9dBsA/X6VWMZf+kmUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FWcwQWRHez3gIHia6wDyGTXC4huvBrkLRyK3EXFiFkU=; b=J
 NTDl0P+XbvnDwKMO8CING2M2fJyGSGohqE/TaMvB0HO8DT2CetEZl5Z5OLe2drF2S6IrZUeFg0sSw
 5BFDadmXNng/47oOzLWXFtE/u3jc2UBTLhWXxeogjozhxBq2Rd8NzLBHxnXX7iF0Hh+ItHVkCbAEa
 lteF0GeNHyTeT36I=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpvw0-00070C-UH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:15:23 +0000
Received: by mail-pj1-f45.google.com with SMTP id v1so3909485pjr.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 08:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWcwQWRHez3gIHia6wDyGTXC4huvBrkLRyK3EXFiFkU=;
 b=H54oRTnfvKxoo4Dvlf3Gy8Qlc+wk199jlu0xCzmjojprS27Qt5Rm8hlsBlrWvSvYkr
 +FZyb133SSq0kBs9KWxoUCHxWk05OYxD4jnF2cYlj7VIaU4Q2Zw/abNppmR9MvR/W5IN
 TFKzuUebZN3DoHgtRdCBhHWH9YqsyKm5OwRnEC5tjk/jGtEPba//Pajmz7yyMWXp1YRh
 3zknxW5gc5kpW7EGiaZfce6ndBRTd0LNBdsCMayR4SiPCCIUD/CeUyNq1YCsG9a4a29k
 TzSv49ygj4lFvQlTJLBC//OkMU4TZLDc4qKoTPW2OmfP805KXVoLzLMiiJjcjtfsHe9J
 wzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FWcwQWRHez3gIHia6wDyGTXC4huvBrkLRyK3EXFiFkU=;
 b=Fv5LhH+0ZzxK7b+va+fyV0m+7PkUNGrqD6HLSVLC6dl6ggOHCvGqsCwSIoVuTcvMGX
 J3X/IoUzdsuN9+qpyL+ADsfAZmmzNiXPwJa8npbi2s970nmVEHZspCgZZqdVJDE4gnG7
 2dePgfeZHXpafTg6zemovaDxP8xeri270EUVE8P8RoqjLX9MgxcI+LkkTzloB1K6GaBN
 UtE+Np2tzTv80YUGLvdbaZLTkZg/U/Q4m0lJqtzPVR++uwxOU7aeyfMzuWz8DvvZ0a83
 285o3x0WbXSOK9rQhiAq7y16hau7HFto31AHLLbmHx7zfxrFuL9X/HAwHJ/oeqBvFGCw
 CTFw==
X-Gm-Message-State: AOAM5317BvPEwQ4mXccnAma3uYJrPC/EBbAgQzUal+3RY2pq2VhYA5Wq
 e53mmyPHzAcjIjaDDNQgJE92kJvUBTs=
X-Google-Smtp-Source: ABdhPJxnvmKlf6nqzTotx/tiWoPWLa1/qPj6kF14k48nYV5rc1RU/rvdEgbSg1W9d7cHa8kfa8B5mQ==
X-Received: by 2002:a17:902:b406:b029:db:3c3:e4cd with SMTP id
 x6-20020a170902b406b02900db03c3e4cdmr23116plr.79.1608221715073; 
 Thu, 17 Dec 2020 08:15:15 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id c24sm6718785pgi.71.2020.12.17.08.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 08:15:14 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Fri, 18 Dec 2020 00:15:09 +0800
Message-Id: <20201217161509.866105-1-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kpvw0-00070C-UH
Subject: [f2fs-dev] [PATCH] f2fs-tools: man page fix for sload compression
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Fix man page for sload.f2fs compression support

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 man/sload.f2fs.8 | 94 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 84 insertions(+), 10 deletions(-)

diff --git a/man/sload.f2fs.8 b/man/sload.f2fs.8
index d07330c..c165b35 100644
--- a/man/sload.f2fs.8
+++ b/man/sload.f2fs.8
@@ -7,22 +7,48 @@ sload.f2fs \- load directories and files into the device directly
 .B sload.f2fs
 [
 .B \-f
-.I source directory path
+.I source-directory-path
 ]
 [
 .B \-t
-.I mount point
+.I mount-point
 ]
 [
 .B \-d
 .I debugging-level
 ]
+[
+.B \-c
+[
+.B \-L
+.I log-of-blocks-per-cluster
+]
+[
+.B \-a
+.I compression-algorithm
+]
+[
+.B \-x
+.I file-extension-to-exclude-from-compression
+|
+.B \-i
+.I file-extension-to-include-for-compression
+]
+[
+.B \-m
+.I minimum-compressed-blocks-per-cluster
+]
+[
+.B \-r
+]
+]
 .I device
 .SH DESCRIPTION
 .B sload.f2fs
-is used to load directories and files into a disk partition.
-\fIdevice\fP is the special file corresponding to the device (e.g.
-\fI/dev/sdXX\fP).
+is used to load directories and files into a disk partition, or an F2FS
+image (file).
+\fIdevice\fP could a special file corresponding to the device (e.g.
+\fI/dev/sdXX\fP), or an F2FS image file.
 
 .PP
 The exit code returned by
@@ -30,24 +56,72 @@ The exit code returned by
 is 0 on success and -1 on failure.
 .SH OPTIONS
 .TP
-.BI \-f " source directory path"
+.BI \-f " source-directory-path"
 Specify the source directory path to be loaded.
 .TP
-.BI \-t " mount point path"
+.BI \-t " mount-point-path"
 Specify the mount point path in the partition to load.
 .TP
 .BI \-d " debug-level"
 Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
+.BI \-c
+Enable a cluster-based file compression.
+The file would be chopped into clusters, and each cluster is compressed
+independently.
+.TP
+.BI \-L " log-of-blocks-per-cluster
+Specify cluster size in power of two blocks.
+The minimum value is 2 (4 blocks, default).
+The maximum value is 8 (256 blocks).
+Note that a block contains 4096 bytes.
+This option must be used with option \fB\-c\fR.
+.TP
+.BI \-a " compression-algorithm"
+Choose the algorithm for compression. Available options are:
+lzo, lz4 (default).
+This option must be used with option \fB\-c\fR.
+.TP
+.BI \-i " file-extension-to-include-for-compression"
+Specify a file extension to include for the compression.
+To specify multiple file extensions, use multiple option \fB\-i\fR's.
+Files having one of the listed extensions will be compressed.
+This option must be used with option \fB\-c\fR.
+.TP
+.BI \-x " file-extension-to-exclude-from-compression"
+Specify a file extension to exclude from compression.
+To specify multiple file extensions, use multiple option \fB\-x\fR's.
+Files having one of the listed extensions won't be compressed.
+This option must be used with option \fB\-c\fR.
+.TP
+.BI \-m " minimum-compressed-blocks-per-cluster"
+Specify a minimum block count saved (by compression) per cluster.
+The minimum value is 1 (default).
+Maximum value is the cluster size in blocks minus 1.
+If compression of a cluster fails to save at least the minimum compressed
+block count given by the option, the cluster will not be compressed.
+This option must be used with option \fB\-c\fR.
+.TP
+.BI \-r
+Specify read-only flag for the compressed files.
+It allows filesystem to release compressed space to the users, since, without
+this option, filesystem should keep the space for future file updates.
+This option must be used with option \fB\-c\fR.
+
+.SH NOTES
+If neither \fB\-i\fR nor \fB\-x\fR is used, all files will be compressed.
+Obviously, option \fB\-i\fR and \fB-x\fR can not be used together.
+
 .SH AUTHOR
 This version of
 .B sload.f2fs
-has been written by Hou Pengyang <houpengyang@huawei.com>,
-Liu Shuoran <liushuoran@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
+has been contributed by Hou Pengyang <houpengyang@huawei.com>,
+Liu Shuoran <liushuoran@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
+Robin Hsu <robinhsu@google.com>
 .SH AVAILABILITY
 .B sload.f2fs
-is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.
+is available from <git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git>.
 .SH SEE ALSO
 .BR mkfs.f2fs(8),
 .BR fsck.f2fs(8),
-- 
2.29.2.684.gfbc64c5ab5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
