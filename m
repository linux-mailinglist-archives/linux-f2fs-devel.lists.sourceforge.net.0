Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B1399E3D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 11:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a17EBAT8oEWIOto/aXwova96rozoJHiikAsxO11U/KM=; b=VyPCqcR+/mNK0XDHoxjPU27NAZ
	SXo3BEdY2r9n0/tq5PLhE0Fa6U//PB0dkqIC/qYZ5ETh5pHm24b2Gpzzagy50QkxiOEKeqld5tPi8
	lwzBgZInreaJ2yxeRT8s7Jx/+gsfv62cLGEq7T3BJw94D7zg9yTfO4UkGUASUOXLuS4Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lok7y-0002MN-Sj; Thu, 03 Jun 2021 09:59:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <38qW4YAYKAC0MaXbNWPXXPUN.LXV@flex--drosen.bounces.google.com>)
 id 1lok7w-0002Kz-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 09:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WodA4cwW8evDahl78i//uxClrYSQx00er8Xt0Jxhbsg=; b=fme2efpcv8v4a9NuBjhgbi9C2d
 xugm2jT/GM6Dw3EWM+2lCoWsJQ0GoxR2F03alti7izZujQzfgT7K/3MJDxF1jPxLZYCIhnb5xowhK
 OFL9F0QJIUjxp/rXdkOvs0fz2ZSZteTKtPXCM8DlHLfod4Ub2t7E3ZBj5gCs60FvkT6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WodA4cwW8evDahl78i//uxClrYSQx00er8Xt0Jxhbsg=; b=Y
 hq0TjQ0h+UKtvdxo5u9KJI6lbW9VMjZ7vJZVra0hv2B+ZiJL2ckPX2/sC/rE99nHNai6gxOI+yT5+
 YiHS5IKX3vpkRg1kJaxpaMU+KP5GJwvPx1pCNDNj6ncPRVsd4A8i1a0dfB8AStyTkeOe1IvaKCFm+
 NN5+d9q+weD5s+p4=;
Received: from mail-ot1-f74.google.com ([209.85.210.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lok7n-0005GJ-Hv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 09:59:00 +0000
Received: by mail-ot1-f74.google.com with SMTP id
 a22-20020a0568301016b02902a60679231fso2970637otp.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Jun 2021 02:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WodA4cwW8evDahl78i//uxClrYSQx00er8Xt0Jxhbsg=;
 b=Ygw51n8wfm9lFZI3xex/mXBhfGsFka65cBbbx7b7+2vgBJoUY9GqxJIMPumNpKmwar
 JPSYeqjLVCudYagM9pzYAr/DIyUDfSi0I/FRTAnE0+v1qsbkc3WeqThX/OuEDlTvrXNb
 zbfdmipGFsubXExWhZ8kpX+CBcwTA1unFVoB+rN2HJ9TD+VDqMyqmhK7gZr0jsklQzJF
 TFE3HA320u2bqyxCCPVbmB0CpCpk6uEz/3zXyUzA7pEFaIhKNloAN/cIHy8c23Z9qAn4
 bRViw2ck+o0aJXumDz0Z9p1VJzESEfLTSR7GquUMH756oFy7zugzbQ2J68fv6sx8eaNc
 y+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WodA4cwW8evDahl78i//uxClrYSQx00er8Xt0Jxhbsg=;
 b=QAoDiY/KUFuIHEvSZnQ3c4rvpTVGq/oK5SeqWSnfHkflOPOmDku85sM5dyvQykSkr3
 inALQK77BPrYiyftAeJodD7wX1wovN5xVIoinpwu1UaNya7v+pbcjHkvR+UZb7aQoJSo
 mtD5ot8m8vA3IhQyjw47lKJT21y+WnqnViDRwiwi8ZA8zgse2i0afI1TZMaGgqvRmVrK
 vD4yjJs5RqmD1VQwuljUwYLKj8YcYtN+TW6z+IqHur4gZ9mfUQdgvK1JA3/tKwReoeNx
 HJhDrEsL+UGlZwlt0+97Tn4Q5bpev0HW1B/ppCpANHElUTrD8sWg4EQRhKVO25dkmkg3
 mCPA==
X-Gm-Message-State: AOAM532UeBsOWil5+kJiyPW29k+YkAUhBspnvQb1UQDd/Ft35M74jlvU
 2uBHlqLlrf4ddGnIvgv6qq2xdP4MuE4=
X-Google-Smtp-Source: ABdhPJynmwoj0mblrAdNot1lXDwB1wQmT9NFiOhQkn9P5Mn/HixT+3+tCZIHQCVLgAxmlYiVHkU6IcBz00I=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a5b:489:: with SMTP id
 n9mr52932311ybp.45.1622713842127; 
 Thu, 03 Jun 2021 02:50:42 -0700 (PDT)
Date: Thu,  3 Jun 2021 09:50:36 +0000
Message-Id: <20210603095038.314949-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.74 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lok7n-0005GJ-Hv
Subject: [f2fs-dev] [PATCH v2 0/2] Fix up casefolding sysfs entries for F2FS
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These correct displaying support for casefolding only when that capability
is present, and advertise if encryption and casefolding are supported
together. Casefolding requires CONFIG_UNICODE, and casefolding with
encryption wasn't supported until commit 7ad08a58bf67
("f2fs: Handle casefolding with Encryption")

Changes for v2: Added comments to double #endif's, added Fixes and Cc tags

Daniel Rosenberg (2):
  f2fs: Show casefolding support only when supported
  f2fs: Advertise encrypted casefolding in sysfs

 fs/f2fs/sysfs.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
