Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50597BBD9C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Oct 2025 12:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nPek8shh3jJEGHqhU5JIFNCCFumdz7DKoC1RadKVJUU=; b=CwznNDzmPdNqWX24maARXG1w8J
	WkQmsUvMOO0UXdFxysS0LeHx+mt+Pscrtvaw84TGvo1tStDMRQxJOZ917Zy/uts5QxXpdEi4HSGYy
	MuCOHI0+gTjhkNQdjpXitebZCXakvNj/A08tJYCq0Y6h6TPhA9nJmOvkIpwdzAJXI8co=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v5i85-0000LF-Ni;
	Mon, 06 Oct 2025 10:07:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <34JTjaAwKAOUQWYbZHRVdZRPNVVNSL.JVT@flex--jprusakowski.bounces.google.com>)
 id 1v5i84-0000L8-6I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 10:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y8AjHP2BMxxekAp+wHrrG6IAM0ijg+DCDAJtMGZzegA=; b=OUAL8SfBP+WRwMr6RRHynC1vpc
 HCMWZWgyT/Pj3zmHRnK1BQ/SjXXwvXNxv3dnDpbkTynJDxwbadZo2dX5/8R4TsboFB++Iobl63sqN
 MXRk6cVdnqYdwqPMKavdLMgz/DvOiQQ4Wjo1v5woxdaYJlkiMw/dwU0qmccVk9orxT+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=y8AjHP2BMxxekAp+wHrrG6IAM0ijg+DCDAJtMGZzegA=; b=H
 ARZ2i7IocBP69vqS9kE+/oaj2kiZAZO09Cme4d6nu1I24QDPUqxRdlRhmrOSWsBDKfb80mQ94tCZC
 oO8Xpv5AMYcednPrSJoYPfD947qr41z6MQZ/k9eIVye4Lw6ibTt3D1COVFg8ycuJX80hbQniNhAM6
 EUXFKxZjLXLbSF+A=;
Received: from mail-ed1-f74.google.com ([209.85.208.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v5i83-0004Rn-T5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 10:07:40 +0000
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-63798d4b7caso4244962a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Oct 2025 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759745248; x=1760350048;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y8AjHP2BMxxekAp+wHrrG6IAM0ijg+DCDAJtMGZzegA=;
 b=ksUxeg/GHKUVHrMmZ90/3fPqUVzOHb89mdjjoLLsyV0ks0zhwv7+/bvqL/g2TUntxz
 tdpJqsQqqm652csAV/KVOAWEkOFmlzhq3cXZ0bjpnzO0T86i26s6MhE67EwbiwWCwMNm
 hMJ01lnUPOvFJ4f4rhePSLAyTQCW8hjjQab1sXAjLzkj83RcC9RnAi2FXSm2eOO+baHY
 LrKCB8/zUsjG9iKj1woo4KHNEM56I0NCLRsJPIYqOgse59jKJNLE0zdLRS9XuWEFpRSW
 MI4WuvEYJm/KFClmXKhQqyQVLU5xDoFt+rHlxV4Nzzn3E3Lb9MZ7Msk2yHl8S3Sv2ZEW
 30ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745248; x=1760350048;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y8AjHP2BMxxekAp+wHrrG6IAM0ijg+DCDAJtMGZzegA=;
 b=kqX9riadqmeC/YfS/Y5hHVjDXh38TD3p9uORzmJAa8hpMXgvam1KtfbBdsdl2gbUp0
 lPFG57okWr5YIitj5XX3ibhigOx2v47olo0qETJl/f6LXYfrPsRxnoyw1sHT/pDbUh+k
 BebJVCrUa0h0spsuiRECn07Pn+hZ9awysuCx8uP2OO2/JccH7AwJoXOizV+27Z79WxNC
 6m0cxSpIePuMS9ac3rQyOSvYU8IEb/Chonv5xq28SqJDqVLtrrIZtjasIG6ICkW6A+xF
 XHkgCU/nLgUkbkWm6OTw6iHfyGXCCWyp2g5WWZ3fLzmkjj6YaHbYiTJLXaH3rrD51Zrq
 2zJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyyC0JhJaAt5WfgrYlw7iVRSgy+uZ/VpPH8pFwf6SJp6TY5cIoGMa+KuApYygGLOsiu5aqVcwE1AKH7kCkT/3o@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzmIwYoMmnvD64j9XmduCVJBFkNxWZ8J0PIgg48kIvHsLmB7A2W
 kRBJsUQKtyTEMrh6uvIwT6YmicKFaZvhcwV28SYypphm8ZBnbcDJ+x9ftR+cJ7bwT6jzOi7panF
 MBuLoWKl3uNnPqawtdb0kCWK/fv3Qmw==
X-Google-Smtp-Source: AGHT+IGaOvMuxw+j8+jAjq57qg7DRkWnQZOVLbHJzaCCRqJzVwyoWB4RMYvEZDlpZvF3gdBG8DuwX+0lyPnJryMyeuQ=
X-Received: from edbbm11.prod.google.com ([2002:a05:6402:b0b:b0:636:7b56:c4f5])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34cd:b0:62f:337b:beed with SMTP id
 4fb4d7f45d1cf-63939c28153mr12378079a12.30.1759745248294; 
 Mon, 06 Oct 2025 03:07:28 -0700 (PDT)
Date: Mon,  6 Oct 2025 12:07:13 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006100713.3501501-1-jprusakowski@google.com>
To: Zorro Lang <zlang@kernel.org>, Chao Yu <chao@kernel.org>,
 fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When running the test in a VM on a host with all CPUs busy, 
 the kill command returns before socket tool shuts down. This prevents
 unmounting
 the scratch, causing the test to fail. The added sleep ensures that the socket
 tool closes before the next test steps. 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.74 listed in wl.mailspike.net]
X-Headers-End: 1v5i83-0004Rn-T5
Subject: [f2fs-dev] [PATCH] f2fs/009: Add delay after killing socket tool
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When running the test in a VM on a host with all CPUs busy, the kill command
returns before socket tool shuts down. This prevents unmounting the
scratch, causing the test to fail.

The added sleep ensures that the socket tool closes before the next test steps.

Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 tests/f2fs/009 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/f2fs/009 b/tests/f2fs/009
index 7333d484..d4893139 100755
--- a/tests/f2fs/009
+++ b/tests/f2fs/009
@@ -95,6 +95,7 @@ pid=$!
 sleep 2
 ino=`stat -c '%i' $filename`
 kill $pid >> $seqres.full 2>&1
+sleep 2
 check_links 0 0 $ino
 
 ln -s $SCRATCH_MNT/empty $filename
@@ -127,6 +128,7 @@ pid=$!
 sleep 2
 ino=`stat -c '%i' $filename`
 kill $pid >> $seqres.full 2>&1
+sleep 2
 check_links 0 1 $ino
 
 ln -s $SCRATCH_MNT/empty $filename
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
