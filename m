Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 350CC679661
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jan 2023 12:15:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKHH6-0002PK-RV;
	Tue, 24 Jan 2023 11:15:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <glider@google.com>) id 1pKHH4-0002PD-6R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 11:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PZZkl0nuhDOnpS6mpTFr8PbXxlSJ2XVVn7nhNW4knVE=; b=KjAejuEGTrI6fRwWpdnVtLooDu
 UZw/Q7W7vAS0vbj75KqPFrZL5WMy6IaJUEq+XuDcjZ+70o4UR8pA5lhblwWsUZM1i4/9qTsOI8WLT
 zulWZoABKnVGScVMVNBhyFgdQil8/rg4P1X4gNAEabqC0mygOsf6FjRXmg/9mVfD+yCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PZZkl0nuhDOnpS6mpTFr8PbXxlSJ2XVVn7nhNW4knVE=; b=Yget3UmDS2xQF0gyXkffijkTtj
 SOgEJe+Mrq0lgY15zGHB0RLM2Wocf3QFcNxuI5/yxk/lPZhSu1R4nRBWm0uu45U05NVmVwOY6Ku3p
 kMmfvOfArSg+KH6J+OFxCrbINmevfYqJ5CDTM+QRqUn9P74JqR9rKeLSJIdgzj71yM6A=;
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pKHGz-00EFJc-1G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jan 2023 11:15:33 +0000
Received: by mail-il1-f173.google.com with SMTP id v6so7276039ilq.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jan 2023 03:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PZZkl0nuhDOnpS6mpTFr8PbXxlSJ2XVVn7nhNW4knVE=;
 b=eysX+ECnIsH4FMjfUYT/LQAt9n6rglG6tqxiFcoAUICMiQfGdw6uRCYzxropjiIHWX
 aGm0Ai3CVpIR3vF+EduIDOySpa/9Cs7/A0TdpklPuDWKFUgQZpGb/QUx7y/gmG1+gJQT
 R0EgI2WlD8RTdP4mKPBp2BIR3O5cm0XeN7nPZ0SG8//AUcx383pwBNqlJlupg5yLuFLh
 /Bt4ywpI6JPeuzM6XnPuB0hUMriFJgSFDg1wnWsB4yXnlV+fcImKNZFnp8e56Zo2rLxF
 LM6SKfI/YCy26+jyb1ULwBcIRsTXvzHOZMkpI89Kjz5MQ29Qw33zMIR8Bf4V25RxB/nC
 pH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PZZkl0nuhDOnpS6mpTFr8PbXxlSJ2XVVn7nhNW4knVE=;
 b=B1NYv+dptW+Xmu1WvzBuMSH2LGF05tN50KOiylfDIy3SLwXF+RT1VROeN1LxOSpHTK
 qhFwgwbH/5qZXrl3xQVgn/vuFaSu6caETSRH3oHL23lTeiXqIx6f7qvYO8zwIWPiQbyg
 vFpLygNUrZoMDeBKXTCn7C4Z+V0hABO22C4V9wM2pVxLxRjqioRC9yGaKqztsb2fy7Z3
 jrvQhFexLmnZHj7pEILHP8/y1cOVS+29molh1VBsmgsgAIO7/v30rNy9c0fBeS9iWcOm
 yJyW5q5Ki6Bec6/MgUrj4egfJCqFL86JGGWrzRag6yAqkYLAxMhZhjrjBB481tqSlkLT
 GWCw==
X-Gm-Message-State: AFqh2krDgzMBtIDm+AF57zoce6QkkIU34LpgrzOIEPW+6KOqnKMcomM8
 rfm5hLD5lMzc7th8OQUAiH6Lghhb4w5MQtN5UtLE2jqa4dW6iIuOxAU=
X-Google-Smtp-Source: AMrXdXs9ga503SwE+09dmDEVZS1/XV2RvPbDoA7tJR1Y92okF1PYzLfNb1qZ9UTKSZ00MIBxwWsvnEHJ4Bii4h03Zso=
X-Received: by 2002:a05:6e02:88d:b0:30f:5d21:e56 with SMTP id
 z13-20020a056e02088d00b0030f5d210e56mr1230055ils.192.1674557526609; Tue, 24
 Jan 2023 02:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20221121112134.407362-1-glider@google.com>
 <20221121112134.407362-4-glider@google.com>
In-Reply-To: <20221121112134.407362-4-glider@google.com>
Date: Tue, 24 Jan 2023 11:51:30 +0100
Message-ID: <CAG_fn=WDjw1MVYhEh7K4HOpGNBWsq6YuyG6Xx7XcP4Xpu+KhZg@mail.gmail.com>
To: glider@google.com
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 21,
 2022 at 12:21 PM Alexander Potapenko <glider@google.com>
 wrote: > > When aops->write_begin() does not initialize fsdata, KMSAN may
 report > an error passing the latter to aops->write_e [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.173 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1pKHGz-00EFJc-1G
Subject: Re: [f2fs-dev] [PATCH 4/5] fs: hfs: initialize fsdata in
 hfs_file_truncate()
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
From: Alexander Potapenko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Alexander Potapenko <glider@google.com>
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 21, 2022 at 12:21 PM Alexander Potapenko <glider@google.com> wrote:
>
> When aops->write_begin() does not initialize fsdata, KMSAN may report
> an error passing the latter to aops->write_end().
>
> Fix this by unconditionally initializing fsdata.
>
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Alexander Potapenko <glider@google.com>

Dear FS maintainers,

HFS/HFSPLUS are orphaned, can someone take this patch to their tree?
Thanks in advance!
(same for "fs: hfsplus: initialize fsdata in hfsplus_file_truncate()":
https://lore.kernel.org/all/20221121112134.407362-5-glider@google.com/)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
