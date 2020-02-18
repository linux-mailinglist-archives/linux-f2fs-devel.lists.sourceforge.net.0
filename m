Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233616371D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 00:24:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4CEF-0001yt-MF; Tue, 18 Feb 2020 23:24:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j4CE8-0001yQ-3O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tIzAEJsuLi1rhHTq8tVU+ryOfNddGx9piIKavCdaTgI=; b=Lk7J7FNzaN/dT3Gj859FxnxFOi
 d6ENbxcK1iI7enaNdTx7rsSI+9R33cYe3BnhWSu6r2CD1t7wqovqnOC3/qUOH3H/alze/Xe+kcc81
 Ph360gU8Re096vzUS6TmyCCOuOtBtGg0Tg+FxEcX7TbiM3pdkr8OQqn3dragwnht6zMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tIzAEJsuLi1rhHTq8tVU+ryOfNddGx9piIKavCdaTgI=; b=eiuA7yij4fq9VPDa/tb+TP4hNs
 7nBBOpnhRZ34QocDOJE+LpBd1vnEE28de7QpnGT9hycIZbbjfP67kiU1PS4dU+RgoiXuyQF5n2puy
 rdVzrtUEOypmQzqo9hc9eYBQHbYKATmhLgVxW4Aa+FaO/5jqgyZE3Z/Us/ex3wb9DG10=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4CE7-00H2Sg-2n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:24:28 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B5F024655;
 Tue, 18 Feb 2020 23:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582068254;
 bh=cE1KL7ESu7HCICcE8VORkQLYSFi1c/bNZgc87tvL56Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zsp/4FRD1CWCCkP19KOIGA2baZ6zLP1vyNzO4mvzKrtGjtLqeHFRIYQeEnd2esFwO
 wbMHNod93deJ4d6Ail3dsW7kuEAu0Sdp0li82EdFJJEEBZHNaUbstYpaYm3H1kKvvn
 C3m/D9fZth1r/Hq9e3B5rjhKACO4QK2KwIjn63eU=
Date: Tue, 18 Feb 2020 15:24:13 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200218232413.GA10213@google.com>
References: <20200214094413.12784-1-yuchao0@huawei.com>
 <20200214094413.12784-3-yuchao0@huawei.com>
 <20200214184150.GB60913@google.com>
 <c0436553-a1b6-8124-a096-15d2c3d5bd79@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0436553-a1b6-8124-a096-15d2c3d5bd79@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j4CE7-00H2Sg-2n
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: clean up lfs/adaptive mount option
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/17, Chao Yu wrote:
> On 2020/2/15 2:41, Jaegeuk Kim wrote:
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 5152e9bf432b..d2d50827772c 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -91,8 +91,6 @@ extern const char *f2fs_fault_name[FAULT_MAX];
> >>  #define F2FS_MOUNT_FORCE_FG_GC		0x00004000
> >>  #define F2FS_MOUNT_DATA_FLUSH		0x00008000
> >>  #define F2FS_MOUNT_FAULT_INJECTION	0x00010000
> >> -#define F2FS_MOUNT_ADAPTIVE		0x00020000
> >> -#define F2FS_MOUNT_LFS			0x00040000
> > 
> > I don't think we can remove this simply.
> > 
> >>  #define F2FS_MOUNT_USRQUOTA		0x00080000
> >>  #define F2FS_MOUNT_GRPQUOTA		0x00100000
> >>  #define F2FS_MOUNT_PRJQUOTA		0x00200000
> 
> You mean getting rid of this change or we need to fill F2FS_MOUNT_* hole as below:

nvm. So, we can reuse the removed bits later in other features.

> 
> #define F2FS_MOUNT_FAULT_INJECTION	0x00010000
> -#define F2FS_MOUNT_ADAPTIVE		0x00020000
> -#define F2FS_MOUNT_LFS			0x00040000
> +#define F2FS_MOUNT_USRQUOTA		0x00020000
> +#define F2FS_MOUNT_GRPQUOTA		0x00040000
> ...
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
