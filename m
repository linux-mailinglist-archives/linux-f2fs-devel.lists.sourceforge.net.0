Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A530D6C82AD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Mar 2023 17:56:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfkht-0003S9-EU;
	Fri, 24 Mar 2023 16:56:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pfkhk-0003S0-1R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 16:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IeUI0dILKAxSbFsLZB41eqbavgPVFjZ83d4rKEO18SI=; b=JXhCmRMb5MnzNwR49swqTd93VO
 99XSu8qlxX+IRiv45G9yU3Jt+m5KKSMGZkvdffk+ahIoanqzomaFZnSD62tEmyhy8lOOQN/3H3ZN+
 mD8yo4pVAG7Jbtw4VlxHMDQA+rs/Bz3B4rvDUiz6V8xYGab1NIDeQEIh8g0PDrNQchJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IeUI0dILKAxSbFsLZB41eqbavgPVFjZ83d4rKEO18SI=; b=HRaxr+zLhYNEJThwMv7ejtIZR0
 fMBwDJmlzHIOiFMYb7o6ZJkjDPVvizNcM+52R7l2oKLpZ9bxogM2HhJ22bmq/q6sPKxShAZwF/pKh
 FEg53DQjLSI5pwgkunJf5USr6315OYt/vfExfdRwqkDtIZbcN0+lCDZE+cDR3TWkjPKA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfkhi-0002c9-H6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Mar 2023 16:55:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51B4762BE6;
 Fri, 24 Mar 2023 16:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EF5C433D2;
 Fri, 24 Mar 2023 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679676943;
 bh=ZEbjlpAh2WrqUnDW5ZNWKy6ydvQ8KRSfEkJ24vJOxjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ffCp+pIcMsdyYgAbrBCxSn401DJbItZ+VxxFzMHcsXi2VWGOLY2bX/srw/reGOTFQ
 HqDM7b+qO2peo1iRH5gMoLIP79B6AGdrgv++ql4AAaOLvY43id26vhJQxmiQ5e0y9D
 HgLFg8NzMx3WDInKRPa8Pi52ceDBvoD8ian5IzW9zFBjjIKIuaAIgO29qphc08J9FK
 ioqq+J4QaKTZWQsgSxZWYBLajFvYL6lhDnBXUom+gcB5jvj/d+dq2CBdUCrQlYdxE4
 NkMaM+xSythvSS17VvfO/pYobKS/b8MftiyS1DXAKaJUHFJhZwBvauOIfNZmn1KB4H
 1iRgbhZ0SFQaQ==
Date: Fri, 24 Mar 2023 09:55:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Message-ID: <ZB3WDpunfgJZhhQy@google.com>
References: <e50ebe1a-73a0-5800-71e3-0ddd366727ac@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e50ebe1a-73a0-5800-71e3-0ddd366727ac@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/24, Colin King (gmail) wrote: > Hi, > > static analysis
 with clang scan build has detected a potential issue > introduced by the
 following commit: > > commit 7e9775a516ff6c1e73ee2b42ec563cafee38 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfkhi-0002c9-H6
Subject: Re: [f2fs-dev] f2fs: factor out discard_cmd usage from general
 rb_tree use
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/24, Colin King (gmail) wrote:
> Hi,
> 
> static analysis with clang scan build has detected a potential issue
> introduced by the following commit:
> 
> commit 7e9775a516ff6c1e73ee2b42ec563cafee38f42f
> Author: Jaegeuk Kim <jaegeuk@kernel.org>
> Date:   Fri Mar 10 11:12:35 2023 -0800
> 
> f2fs: factor out discard_cmd usage from general rb_tree use

Good catch!
I found the bug and will post v2 soon.

> 
> 
> The warning is as follows:
> 
> fs/f2fs/segment.c:1425:4: warning: Value stored to 'tdc' is never read
> [deadcode.DeadStores]
> 
> The while loop in function __update_discard_tree_range is as follows (+ my
> annotations):
> 
> 
>         while (1) {
>                 struct rb_node *node;
>                 struct discard_cmd *tdc = NULL;
> 
> ### tdc is set to NULL
> 
>                 if (prev_dc) {
>                         di.lstart = prev_dc->di.lstart + prev_dc->di.len;
>                         if (di.lstart < lstart)
>                                 di.lstart = lstart;
>                         if (di.lstart >= end)
>                                 break;
> 
>                         if (!next_dc || next_dc->di.lstart > end)
>                                 di.len = end - di.lstart;
>                         else
>                                 di.len = next_dc->di.lstart - di.lstart;
>                         di.start = start + di.lstart - lstart;
>                 }
> 
>                 if (!di.len)
>                         goto next;
> 
>                 if (prev_dc && prev_dc->state == D_PREP &&
>                         prev_dc->bdev == bdev &&
>                         __is_discard_back_mergeable(&di, &prev_dc->di,
> 
> max_discard_blocks)) {
>                         prev_dc->di.len += di.len;
>                         dcc->undiscard_blks += di.len;
>                         __relocate_discard_cmd(dcc, prev_dc);
>                         di = prev_dc->di;
>                         tdc = prev_dc;
> 
> ### tdc is set to prev_dc, however, it is not not read any more with th
> introduction of the "goto next"" statement introduced in the commit
> mentioned earlier
> 
>                         goto next;
>                 }
> 
>                 if (next_dc && next_dc->state == D_PREP &&
>                         next_dc->bdev == bdev &&
>                         __is_discard_front_mergeable(&di, &next_dc->di,
> 
> max_discard_blocks)) {
>                         next_dc->di.lstart = di.lstart;
>                         next_dc->di.len += di.len;
>                         next_dc->di.start = di.start;
>                         dcc->undiscard_blks += di.len;
>                         __relocate_discard_cmd(dcc, next_dc);
> 
> ### tdc is always NULL, there is no path to this code where tdc is ever set
> to a non-NULL value.
> 
>                         if (tdc)
>                                 __remove_discard_cmd(sbi, tdc);
>                         goto next;
>                 }
> 
>                 __insert_discard_cmd(sbi, bdev, di.lstart, di.start,
> di.len);
>  next:
>                 prev_dc = next_dc;
>                 if (!prev_dc)
>                         break;
> 
>                 node = rb_next(&prev_dc->rb_node);
>                 next_dc = rb_entry_safe(node, struct discard_cmd, rb_node);
>         }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
