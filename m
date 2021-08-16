Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B73ECCB5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 04:37:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFSVf-00030O-TM; Mon, 16 Aug 2021 02:37:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mFSVf-00030I-2I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8x+g2ha9ik4Vgy3+UW2RYKLfsxqik39pgGC8FWWjP6o=; b=lt5pTeTHeKQA1zl0c47dzlfwDZ
 H6Q/9lfM65tNWhLbpaAuzWRzLFDJOXagzCkt5dAkh6nbVc9fKVVYW6/1xUoohC+PS/iEx9rAUxIyF
 Qk6sXEmgvXbw67G8akcPB4e4k0zOi5JqR+32vnIcrwC+12+6LmmahFFgyAf82GANSnHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8x+g2ha9ik4Vgy3+UW2RYKLfsxqik39pgGC8FWWjP6o=; b=E3SkeYfz9buj4UJ/luimnLSgzU
 uKE+pGArRFHBIwtdkFxqu8vgJhiDWk0JRdq4jjdH9RkBXoE8s6WelcSWflFHAGR6wuXFLyIITc9C/
 J20i2BYt8L7l+8XRGoLtu/ZBJ0AmYPu4aUBUhY78KHVbk8zDk0/yIVmipb1aXVP9oSno=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFSVd-0002sV-Mp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:37:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C5386142A;
 Mon, 16 Aug 2021 02:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629081468;
 bh=8x+g2ha9ik4Vgy3+UW2RYKLfsxqik39pgGC8FWWjP6o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ruaLrpfV3CVut1lGYP3YkImXbdMcb/OC5RPArUr+daWUt0Y49OOMKhoWzdeGWawso
 tiGMtEFgHGG9sU084D8mOVIZlt/2TmJut6zIvgprx0DujIT2IBOYdVK0UlAqqB8rXE
 aIJT/ei/ndGdRjuQSFmEv0wipJkvpBj3YeVFaCmaT+5uAF+ZBOjnr7mYm90z6Fb+be
 LrgTzMrXbhtIX52CdzGNH4z8hO+1fOui/xOwklAVCOD55IhHEdx2ICMYmiiEDnWkYU
 8hh8DFUo1tuNsyKLlylD8nitCjqizspr749TuLZZUQ3ByIRkbT6FVQUtZczlSqFOJ9
 cB5bIwyDIgzSQ==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210803225542.3487172-1-daeho43@gmail.com>
 <2a79c1c5-366b-92d9-4025-dbda660b1178@kernel.org>
 <YRWKKQe0bcgjKIIA@google.com>
 <b1a7b8a6-89dc-9076-2388-ced59aa8c47c@kernel.org>
 <YRbARsMfs2O2fz2s@google.com>
 <b76b5b09-d806-992b-3256-fe7ebfc4a2df@kernel.org>
 <CACOAw_zTAFfQGqRVRADq_dyO-Rf++Sn+uhwJZ+4MHv4rPwozCw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <ceaed49c-9e7b-3d14-a540-28d5382b672b@kernel.org>
Date: Mon, 16 Aug 2021 10:37:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_zTAFfQGqRVRADq_dyO-Rf++Sn+uhwJZ+4MHv4rPwozCw@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFSVd-0002sV-Mp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce periodic iostat io
 latency traces
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/15 12:27, Daeho Jeong wrote:
> Actually, I was working on it, after Chao pointed it out.:)
> Merging them into F2FS_IOST and separating it from other files looks better.

Cool, :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
