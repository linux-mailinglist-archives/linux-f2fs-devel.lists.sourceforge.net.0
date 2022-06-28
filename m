Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AADBB55EB0B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jun 2022 19:29:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6F1X-00024j-CT; Tue, 28 Jun 2022 17:29:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <vincent@systemli.org>) id 1o6F1O-00024c-U4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 17:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDpy1s8pb/cXsfIPjcWXyT18L5b3hjA0v1sNszSsqUE=; b=ARW8AVQ06rwh8mT+/tj/h0X5EN
 zK8tkB6bDyDahc6lVeaMyS33pDGznwzZsmA22Y+IiQmFFVa9Jbirp5DUZlOUUcvqjVwdzfqdZ7F9X
 fE46PG2cKD6noZdB6FcfuBqL0xrJOZMBekSzZVu3SvJzL/Lts3JaqCCqwEBesmzmUbFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pDpy1s8pb/cXsfIPjcWXyT18L5b3hjA0v1sNszSsqUE=; b=dmCrD4NCMzSkAf/KCi4wzmka6/
 3cBK7VvflcFxK1MGbzvPP2JWWAQM1t/J7J+9LUmbsWghNCM/Y6lYyTVhF72ljBjrcPW2O7iAd1F4n
 f1XmT5In4hU6BX3E9hvRMzBFavhKAH0cYC5cvt2w7K11qkJ61n0m7nQ2ZBvtfMI4MArA=;
Received: from mail1.systemli.org ([93.190.126.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6F1N-00HJ4b-CL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 17:29:06 +0000
Message-ID: <735ee243-3a65-c638-751a-86da3b37090a@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1656437335;
 bh=pDpy1s8pb/cXsfIPjcWXyT18L5b3hjA0v1sNszSsqUE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LDtUUmLrJ7lp7o6BLVV64xOwW+nEiFNPb0MHREU73csmGp0EtDLWtBCNvOXiu0oOq
 wN1COAtZOP4fq4UbZuI3Zq0f5eRbfiD5ES+jylShvSpFXYagb6EdJuqU2/iUtWxJZG
 BBz+yR8uRYo5JSPUw9FVidxpK4SnwfMGA8iwF0G/YN+uHDishwMEX3Kyhe0DHkmLhL
 rVE55mln7kJJqYr63rczxAzF+5zVrz3UoigPq92ohgaR4qvuel6HASR2l2e36ZFNsv
 w6auiG1K4hbXoO/KTQgeBMoIMzPgkTIMecLzA9cKTR+GduAxnWxOqksqixY8zy8dbI
 xkbeXNNS7p1sw==
Date: Tue, 28 Jun 2022 19:28:54 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk.kim@gmail.com>
References: <20220627213947.2317-1-vincent@systemli.org>
 <CAOtxgyfQgF2xARvU_6pHrS+ZZsqfMgJ3SOCB=0NHQgkq4qt7_g@mail.gmail.com>
From: Nick <vincent@systemli.org>
In-Reply-To: <CAOtxgyfQgF2xARvU_6pHrS+ZZsqfMgJ3SOCB=0NHQgkq4qt7_g@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/28/22 18:16, Jaegeuk Kim wrote: > Do we need this? I
 hit this check failure in ubuntu. Can you try "--without-blkid" or
 "--without-selinux"?
 Maybe we should set the flags default to false. I can update the patch. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o6F1N-00HJ4b-CL
Subject: Re: [f2fs-dev] [PATCH] configure.ac: fix AC_ARG_WITH
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/28/22 18:16, Jaegeuk Kim wrote:

> Do we need this? I hit this check failure in ubuntu.
Can you try "--without-blkid" or "--without-selinux"?
Maybe we should set the flags default to false. I can update the patch.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
