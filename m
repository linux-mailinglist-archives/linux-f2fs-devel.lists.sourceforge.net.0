Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A02D2583
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 09:16:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmYAm-0002MV-OI; Tue, 08 Dec 2020 08:16:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kmYAl-0002MJ-OA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 08:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=doyuajGDAoaPFhb2ThVHLJXkkRiThGYIceTU9U28wvo=; b=iCJ2YT45YRCUP0tC9BQM1E//4X
 v6uGR1vl2MqzFGkJE8Kc33q0bJKmk1PjgZMMkJNtvfvdsm+euMiMxmZ1h9CqeJjQXbCF1+TNifoY4
 nUMLtCrSI8vICkOgRuWLKylKvCeXxe+gR6K747HtK3TfvnDbLmTegYnmNYR+3f0EqwIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=doyuajGDAoaPFhb2ThVHLJXkkRiThGYIceTU9U28wvo=; b=a
 ymgR0RtVsROzVWuE3ht5zgCyGy9vQ4wLd96HjpBJjVgk2mYTh0wyGcQVsM8REywygcs4CMVtALzfD
 BH/OtjbZGQNkqEFfmKVYBQpMwaUqVnGLdogfGGZYUhRSiDnHFR5ayUzz9xyHBnXYfOHXukn4eliFD
 YH+bNi3ajmkZLXxQ=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmYAf-006JLQ-3J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 08:16:35 +0000
Received: by mail-pf1-f169.google.com with SMTP id t7so13190065pfh.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Dec 2020 00:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=doyuajGDAoaPFhb2ThVHLJXkkRiThGYIceTU9U28wvo=;
 b=UwaqcnxsgNg+Eah831M9BmQwB2ktvoblX8ZrsYSTufXDsaw+bp9+Ph2idzejBljmEQ
 KootQ475aqQ/p6z1VvMdVDlqxDNJZk2DiwM4mkuVnbdvY1NAUCFIS7CbTCzdjlhy8N+/
 QML0C1kk8pIoBFI3mcZS8j2acu5RrmCKgR6UlUPNvZdeNdHQQ2+mjpMy6xjO5cewvu0r
 ez2g4+utTrMhUJRFSaVfCLnQyLAQoLoyE8NcfW24WTAl7Ryr/8Lw3XzlSsN5Lcu/GLHo
 zfMFbokaBzuklRj/Ih9/HBsDmzqljDJtiODCCkpDbsiEioNRFqLXDajLE70iqSuYJcY2
 ddWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=doyuajGDAoaPFhb2ThVHLJXkkRiThGYIceTU9U28wvo=;
 b=DD4t/ZpUBUx77nVVRWqvHJMHPZCVbQfh7IsuXTSGWZ7WBDj5ZyHl6GZtaz6zBsBWjP
 ymVYw6vlDtSn88XxGYj7GILyPvJKu/Q9nUT0UjjC5g8p5rWWhxMyqqGYB0sEK3h5eZNJ
 zGx6b4aMgI13nbMXIeQ9R13wUPZMW213L7vXFxdk63yLObkTao/11Du4Ae6X89c2LWJ8
 4Dxa0CfDMMsiP4YQBvyeooGNca68XsCdwF5dI2vxDndUM1euIi7JtS/YtUHRSGw2sXBb
 Q5eG7Cbb25faRvKPTFz2CVaN4UjZCCISHJClNYb8VUg5E8Dr7izXPVyxZohWxR46iLNk
 CGmw==
X-Gm-Message-State: AOAM53232hhPGxE1t9co55LV8tFowznKF0W6vsMPXaOH+dMHdbUorQBK
 JVYckDrd7WHDuwtCHc0wraFcWqQBoMg=
X-Google-Smtp-Source: ABdhPJxT0hm+M6B2y31Of0DZaD5YuGsxFjOHmE2hsFsLjElQxEWKGfzPJKNSyCybXynA9FG9qbKYFQ==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr3120963pjb.111.1607415383065; 
 Tue, 08 Dec 2020 00:16:23 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id d4sm2093574pjz.28.2020.12.08.00.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:16:22 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Tue,  8 Dec 2020 16:15:52 +0800
Message-Id: <20201208081555.652932-1-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmYAf-006JLQ-3J
Subject: [f2fs-dev] [PATCH v3 0/3] f2fs-tools: sload compression support
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

* 3 patch set:
  #1: added some #ifdef for easier support
  #2: main code change
  #3: automake changes

v2 fix (from v1): fixed a bug and a more elegant error handling flow.
v3 fix (from v2): ./configure (automake) automatically determine to
compile in lzo and/or lz4 compression support depending on the presence
of liblzo2-dev and/or liblz4-dev

Robin Hsu (3):
  f2fs-tools: Added #ifdef WITH_func
  f2fs-tools:sload.f2fs compression support
  f2fs-tools:sload.f2fs compress: Fixed automake

 configure.ac            |  12 +++
 fsck/Makefile.am        |   9 +-
 fsck/compress_wrapper.c | 102 ++++++++++++++++++++
 fsck/compress_wrapper.h |  22 +++++
 fsck/fsck.h             |  15 +++
 fsck/main.c             | 157 ++++++++++++++++++++++++++++++-
 fsck/segment.c          | 202 +++++++++++++++++++++++++++++++++++++---
 fsck/sload.c            |  67 +++++++++++++
 include/f2fs_fs.h       |  76 ++++++++++++++-
 lib/libf2fs_io.c        |  33 +++++++
 10 files changed, 678 insertions(+), 17 deletions(-)
 create mode 100644 fsck/compress_wrapper.c
 create mode 100644 fsck/compress_wrapper.h

-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
