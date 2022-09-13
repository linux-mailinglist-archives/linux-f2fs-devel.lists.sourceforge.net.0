Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADE75B6604
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 05:11:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXwKm-0002Pj-FU;
	Tue, 13 Sep 2022 03:11:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oXwKl-0002Pd-45
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n7I41PUpS+iHbETfQn5WmxK5EdVObpmTZ6DEyC0XJdA=; b=aRatyyYf8UBqUGdYyrsoIQYPBv
 ippmXCR+lqTBQZrQOw+uO+XGeA8v7MXgCNVDi56mRBvPJeknXBLhJcyWKd5KutABwpY9+dWIaacEd
 Lkj4qOT2F3CZ3lGsPqLnJ9vGLDYqh37GF/ECEfBIqMT7mBxzj+Kmfy52bkxNXJMvqKqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n7I41PUpS+iHbETfQn5WmxK5EdVObpmTZ6DEyC0XJdA=; b=CJ59v/hhTZ+m2+tGGmMx2IRZNI
 GWyWh33l5K0BCtA7PefwugYVyhYmgVhlh5cr3O647SCrh1yt6aZwyws06IOic1RWCpta0CC/A4Bln
 qE7TaviJbsaDxu9/MHW6zpFxs00hXgn3pLW1y0a0FS7b7j2bCbr8OPzT7WKQ0gPCdtVY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXwKk-0004fL-GH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:11:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2185961312
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Sep 2022 03:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14998C433C1;
 Tue, 13 Sep 2022 03:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663038687;
 bh=T82nGUCNImec5KMWq8d1Rk3J3+w64aQ6jgFDyTq/njw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=jg6Jw+RpYDfVREd/4Ipyatsnyv5+EI3o7gVvwtQwZNYswbGDXsJ41NlNDwl5B4265
 KEbyW6s43OSRFTx0Tz9qf/smJYBcOJ2zvkCXdQnlnqdaBKPPDH8wPdpoL/ASjPlJW/
 o59obaVTdh6OIjzg0NoxU9H5EM+XZjxKsqQUVGC7aXzs0YzCGNtDgjQrcvPOdE4iry
 B528uq0Rg0TcbSoom1szEQd5ICY4CzJUIxenJPyRbyhfg8EiR4I224dqQUIKeXToMp
 GoVuK6RqrfdII7UHERsgHDUO2pBWMZF9e3wHF8HhRB8VxeDi7i9IOkAnh3C8N2kADW
 E/llEWOoQ78/g==
Message-ID: <791f5692-0814-2bd7-712a-829e1cedb891@kernel.org>
Date: Tue, 13 Sep 2022 11:11:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220819231514.3609958-1-jaegeuk@kernel.org>
 <20220819231514.3609958-2-jaegeuk@kernel.org> <YwaKbmB23U9czf51@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YwaKbmB23U9czf51@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/25 4:30, Jaegeuk Kim wrote: > Otherwise, pending
 checkpoints can contribute a race condition to give a > quota warning. >
 > - Thread - checkpoint thread > add checkpoints to the list > do_re [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXwKk-0004fL-GH
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: complete checkpoints during
 remount
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/25 4:30, Jaegeuk Kim wrote:
> Otherwise, pending checkpoints can contribute a race condition to give a
> quota warning.
> 
> - Thread                      - checkpoint thread
>                                add checkpoints to the list
> do_remount()
>   down_write(&sb->s_umount);
>   f2fs_remount()
>                                block_operations()
>                                 down_read_trylock(&sb->s_umount) = 0
>   up_write(&sb->s_umount);
>                                 f2fs_quota_sync()
>                                  dquot_writeback_dquots()
>                                   WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount));
> 
> Or,
> 
> do_remount()
>   down_write(&sb->s_umount);
>   f2fs_remount()
>                                create a ckpt thread
>                                f2fs_enable_checkpoint() adds checkpoints
> 			      wait for f2fs_sync_fs()
>                                trigger another pending checkpoint
>                                 block_operations()
>                                  down_read_trylock(&sb->s_umount) = 0
>   up_write(&sb->s_umount);
>                                  f2fs_quota_sync()
>                                   dquot_writeback_dquots()
>                                    WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount));
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
