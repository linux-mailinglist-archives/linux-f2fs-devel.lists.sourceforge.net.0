Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD681398076
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 06:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hiOj6Cq9iGgz5+7d1Guks28UDDEcdP2yS2DJEu8LAgw=; b=hOs6/uYxyp9BLsGrtroE9Whgmz
	jAMmM+s5bpxyK7eXXqIGVYWgKEggxRKgMYw9Fp4Q2aaBn3ab/zlpfHo6tJ1DTfA7TdL21kgywk0YK
	Qb7zSqbVgqRd1PiArm4TbMqqfZdUWDev0nYXnpimtIzm/qeM75VzJ5Ecgm1qc4KNyMOQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loIiA-0007R4-GM; Wed, 02 Jun 2021 04:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3_QW3YAYKAPAVjgkWfYggYdW.Uge@flex--drosen.bounces.google.com>)
 id 1loIi8-0007Qn-KT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 04:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Qx5/477Yig5L61OFwMLDnCrLXWV7pw+VxgbIq/I9BM=; b=I07mHtlqyEC5QcaguRqA431jqv
 kb/9bhJRM/zOjkX89fLcj9nOiuFvm8joPF5FTGPykMNenBG6nLXFqyWYFHQK759Mzh7+EyQIb1jSb
 yGe5RCOINZmFvvns4Ik8GMTebx9GpZVKfrxUsA1nIM29B1rdkWrepticJX1ga8MZDgxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3Qx5/477Yig5L61OFwMLDnCrLXWV7pw+VxgbIq/I9BM=; b=j
 1uiC4XjxxxOTnmpd4HmL2Yw9HrEd5VfOPkBcP2ZSOSw3dRdbk8UfhuWosGHcaSjbBg1/l72ISiKTo
 1g6Y9In0aM8gMa/usvWzr6opNOmpPuHCK1B2WUcUI16ggrRqydz7KpvRwCY9B/J9/bbDZjS3kZ3+i
 sXVY7CQdczsl4O4I=;
Received: from mail-ua1-f74.google.com ([209.85.222.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1loIi8-006jsg-0F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 04:42:33 +0000
Received: by mail-ua1-f74.google.com with SMTP id
 j9-20020ab060090000b0290256b90cfee7so464936ual.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Jun 2021 21:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=3Qx5/477Yig5L61OFwMLDnCrLXWV7pw+VxgbIq/I9BM=;
 b=L4wMXF1m8uq8W5WDMHlMk9MaVK+4srL2mJ9ZomD/pApmJ9j+gxFXP7dDFyydmkacHH
 WacTdf81pGqdvLvoz5gZadfm2l2WKrMeDLO+BiFjZXYjAxarXm/5RJ6ba0Mbj4+FvlPL
 12VSAsoX/s/leIHxA7XELMO0/Y6NVtlv/w7FQIFKDdo9C7jZP5CpfKC46D1K9HPf5Gv0
 sFQWT7lFZtubTQF74Gj8SqrPY9HtpBPQ+UyoVXUB1vRDNaJ+wqdOSusVklrop/W4ZfIq
 3vud/O85q5mpKbn0PT99LL5qmb34Nr7VCwN9iOy3iGewPTUm6JOPmhdvvpwb5Y0PTzS0
 C7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=3Qx5/477Yig5L61OFwMLDnCrLXWV7pw+VxgbIq/I9BM=;
 b=gEnTvGXYs8YGG5kqfKGqpSggGjqXIpQ0yTrRjHC2umarF1xkJ2zuYRQznflSVYz6YU
 4F5o9GUtLIzucnbjBQGjGrgy9r3mvCoQp02hBHGFysv1MBiCmRGgpGiloixDXXFN6YBK
 174TBzyEiSikdMy4iPPR7CfJtCCwOl8QKWucL1Y7finQrcBDyl3zhwU/CZzcQewaJQG0
 ZKFOu6cmbIJsk1yMapMueZpjfOvg0b9iQAtbxf3cfJ0ijAT6nH5y0p/BQ4EBLoCZeato
 EV+7miCSDel2aUlXoexhJ4KLfE+brthtpOXxYLnVn7n++bOr1L2B2J35iTMjdush9U0L
 Bbvw==
X-Gm-Message-State: AOAM530+WJX+Bu69ppZvcNvDA7bD94i/KQHaCznv8NZ9JEKkM6AroKRc
 Q3xSmos6awBrQeDSkYSudHtN4evXF6o=
X-Google-Smtp-Source: ABdhPJw5z7A0yAHelyWLEpnQXuueYkii5ep7MSUB4n11ebXmNMqnwoECb2sYiUUqoQDdLDNgwn/I6twKdPA=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a05:6a00:882:b029:2de:b01d:755a
 with SMTP
 id q2-20020a056a000882b02902deb01d755amr25380274pfj.43.1622607357461; Tue, 01
 Jun 2021 21:15:57 -0700 (PDT)
Date: Wed,  2 Jun 2021 04:15:37 +0000
Message-Id: <20210602041539.123097-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.74 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1loIi8-006jsg-0F
Subject: [f2fs-dev] [PATCH 0/2] Fix up casefolding sysfs entries for F2FS
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

Daniel Rosenberg (2):
  f2fs: Show casefolding support only when supported
  f2fs: Advertise encrypted casefolding in sysfs

 fs/f2fs/sysfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
