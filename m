Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AF286A44
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 23:33:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQH3d-0001Mx-GU; Wed, 07 Oct 2020 21:33:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQH3b-0001Mh-T8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glUSV/N1jXIMwWDTVuu1O7SFRN7SseR5volhQc6HzA0=; b=Xw8ia1sDxVtsfKuILDAzUh+YxD
 MlG/MB1bP/gzeKyW2RAYqRVG3NGn8zjjYCBfTqnkbOxfCi/ZYTKHtWjxXt0rkYJqy7/hzsFpoBkg/
 EJO9y95BlZWuypoPe8qG49691IOalGf5Z7xti7xrRlGfOO0XjVyUuXwMqX0pgt8c0ex4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=glUSV/N1jXIMwWDTVuu1O7SFRN7SseR5volhQc6HzA0=; b=Xb8h1awUcXPR3LgiyS0G3dmlZi
 qvyY2UgJJSnyggUkThmGo29zPnHHk/55gDOhFgiWAH7w6/bkhLbgBh9HvNqmpLqI97nWN5uxceful
 NC5kHFViFQCV+AiozE37JTdoezfOfyBIkJMs+wpJTfbKLmpSaM6grVJ1tjf96MiaDoRU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQH3U-002Uaj-R7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:33:07 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0434B2083B;
 Wed,  7 Oct 2020 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602106375;
 bh=/x/sTo/eJjSQ296lRma1jF5McQ8+RG2igB6SGcnoNr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WOY3O+TrN+cvDQ/hm3RFovBwbNfMijWaOZqhkdXkTxTk3tjnXhgYbL4P6ngbHbFOy
 6cciT4lsiwQl02cBTh93+KLCmNjgJW5N8vvkZyOP3J84CN9/AEtZ86GjpdoG1Z+7M2
 e7RsH7vVKWcK4ICsUNhGBRG8ZVzDjKuu3DzHtzdY=
Date: Wed, 7 Oct 2020 14:32:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20201007213253.GD1530638@gmail.com>
References: <000000000000432c5405b1113296@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000432c5405b1113296@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQH3U-002Uaj-R7
Subject: [f2fs-dev] [f2fs bug] infinite loop in f2fs_get_meta_page_nofail()
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
Cc: syzbot+ee250ac8137be41d7b13@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[moved linux-fsdevel to Bcc]

On Wed, Oct 07, 2020 at 02:18:19AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a804ab08 Add linux-next specific files for 20201006
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=17fe30bf900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=26c1b4cc4a62ccb
> dashboard link: https://syzkaller.appspot.com/bug?extid=ee250ac8137be41d7b13
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1336413b900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f7392b900000
> 
> The issue was bisected to:
> 
> commit eede846af512572b1f30b34f9889d7df64c017d4
> Author: Jaegeuk Kim <jaegeuk@kernel.org>
> Date:   Fri Oct 2 21:17:35 2020 +0000
> 
>     f2fs: f2fs_get_meta_page_nofail should not be failed
> 

Jaegeuk, it looks like the loop you added in the above commit doesn't terminate
if the requested page is beyond the end of the device.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
