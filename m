Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIP/DJXx52mhCwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 23:52:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 534AB43FE2E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 23:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awa1PQI3NrU+loCs9dkqk/KkB/VFWqW6SdFvOu/MyPE=; b=VhXurow9UbX+ICDV556NckAk1H
	NWuT50z2P0XS95OcwLFhaOlnid8gLzicXMYYz3GY/bm3oN3+ePScuo7Anz6zVHZPc5ivDRx3EeWgc
	k5kxjfP7GJLlpUxbHJgwJ55TJp5VbEqFwelgsQcvrsn5/cvEys+/rXD+cVNF91IA+cYM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFJ0y-0004B5-MP;
	Tue, 21 Apr 2026 21:52:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wFJ0w-0004Ax-Un
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 21:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QFKXxx++M0GFqxC4oAREuLnjclL2wT5XauEG+lOALG8=; b=UB7fK2lNRFAZj+xtT6bZH/jZGz
 u4qrrcDCWPrQxQRZSXqtfTy7R2ZcVC5K+iEzMcOjW0doWqmSe5vEP42honb6aCHB1rW+OfXxY4fTn
 OrrYXS4eNrJPuphvWWQh9Y1w4UFCczKkpioRJwPjRdtklLUp6EGTyww+kpizLG0BUhOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QFKXxx++M0GFqxC4oAREuLnjclL2wT5XauEG+lOALG8=; b=bqzL3YnErQjVOqR8I0oQOpVy4l
 Ou4X8LsXtHqQCUUYn376b8zmVjX8OLn5eQxUOQ1mX5mmCGzrVX7aparhSdEEHIaXi9tZDVmP1a4Dw
 IQ7XB4aUnTUqNScxr9K+SDjt9JXeNA+Q4eRt50cFa4poEcwlwYq2JyUsdhlIjyfuA7Xc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFJ0w-0005lg-44 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 21:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9126A400E3;
 Tue, 21 Apr 2026 21:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F858C2BCB0;
 Tue, 21 Apr 2026 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776808323;
 bh=OlWtbmYbOWnAJpeScXahNQiA9AtqdGgQZoXaMjcy5tA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skK3joQsw1DrbmsPot4bHmwLJukEtMwUCJ72ROrFtW4tv8Dzk+W1Zj+74kvzxq3FG
 UAKjA21KWp29UOwlnOg4Ypfxjs0LgAJ2Iugee6XhVZAK6/TQqhGUf5cYC9haXrCS0L
 yq6JeDNCuwlQSN/JOE0BK65HmBjJ+UhaMi87ixYFBKKqlUoZPNiW0+TclJq65LCRNq
 Hk+BX2Fy5LkhhLVFJZukTfUBbUzYX4bVUV1/f7oxJniS9YT83hZ/ATbYHUXna0bmz7
 3wF4f7t/xGZQcUpN2LGnBpbaiXEVznIyQDZ5p5KiqjlqWocEUJGM+jPJ86TjudcDr6
 hVWkoWlTi3jwA==
Date: Tue, 21 Apr 2026 21:52:01 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aefxgWziiiNc73d2@google.com>
References: <20260403144015.221811-3-monty_pavel@sina.com>
 <f997ceb6-85d1-4872-be06-2a50469b3b18@kernel.org>
 <5c222edf-6888-4007-9240-9e7988b2dc71@sina.com>
 <ac9d0f35-52dc-4371-a692-39c1d4ae5555@kernel.org>
 <a643b967-cb05-4de5-96f2-f1b783c9758d@sina.com>
 <bedd1951-681b-4364-80c9-c7fe6886c992@kernel.org>
 <252cb446-e313-417b-b780-85dcdcf34a87@sina.com>
 <9b518ad1-18ad-4eb4-86d4-3a27e40a7635@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b518ad1-18ad-4eb4-86d4-3a27e40a7635@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/21, Chao Yu wrote: > On 4/21/2026 4:44 PM, Yongpeng
 Yang wrote: > > > > On 4/20/26 15:28, Chao Yu via Linux-f2fs-devel wrote:
 > > > On 4/19/2026 12:29 AM, Yongpeng Yang wrote: > > > > > > > > On [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFJ0w-0005lg-44
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix node_cnt race between extent node
 destroy and writeback
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,vger.kernel.org,sina.com,lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: 534AB43FE2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/21, Chao Yu wrote:
> On 4/21/2026 4:44 PM, Yongpeng Yang wrote:
> > =

> > On 4/20/26 15:28, Chao Yu via Linux-f2fs-devel wrote:
> > > On 4/19/2026 12:29 AM, Yongpeng Yang wrote:
> > > > =

> > > > On 4/18/26 8:51 AM, Chao Yu via Linux-f2fs-devel wrote:
> > > > > On 4/17/26 21:26, Yongpeng Yang wrote:
> > > > > > =

> > > > > > On 4/17/26 17:00, Chao Yu via Linux-f2fs-devel wrote:
> > > > > > > On 4/3/26 22:40, Yongpeng Yang wrote:
> > > > > > > > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> > > > > > > > =

> > > > > > > > f2fs_destroy_extent_node() does not set FI_NO_EXTENT before=
 clearing
> > > > > > > > extent nodes. When called from f2fs_drop_inode() with I_SYN=
C set,
> > > > > > > > concurrent kworker writeback can insert new extent nodes in=
to the
> > > > > > > > same
> > > > > > > > extent tree, racing with the destroy and triggering f2fs_bu=
g_on() in
> > > > > > > > __destroy_extent_node(). The scenario is as follows:
> > > > > > > > =

> > > > > > > > drop inode=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 writeback
> > > > > > > >  =A0=A0=A0 - iput
> > > > > > > >  =A0=A0=A0=A0 - f2fs_drop_inode=A0 // I_SYNC set
> > > > > > > >  =A0=A0=A0=A0=A0 - f2fs_destroy_extent_node
> > > > > > > >  =A0=A0=A0=A0=A0=A0 - __destroy_extent_node
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 - while (node_cnt) {
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 write_lock(&et->lock)
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __free_extent_tree
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 write_unlock(&et->lock)
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - __writ=
eback_single_inode
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - f2f=
s_outplace_write_data
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -
> > > > > > > > f2fs_update_read_extent_cache
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 -
> > > > > > > > __update_extent_tree_range
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 // FI_NO_EXTENT not
> > > > > > > > set,
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 // insert new extent
> > > > > > > > node
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 } // node_cnt =3D=3D 0, exit w=
hile
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 - f2fs_bug_on(node_cnt)=A0 // node_c=
nt > 0
> > > > > > > > =

> > > > > > > > Additionally, __update_extent_tree_range() only checks
> > > > > > > > FI_NO_EXTENT for
> > > > > > > > EX_READ type, leaving EX_BLOCK_AGE updates completely unpro=
tected.
> > > > > > > > =

> > > > > > > > This patch set FI_NO_EXTENT under et->lock in
> > > > > > > > __destroy_extent_node(),
> > > > > > > > consistent with other callers (__update_extent_tree_range a=
nd
> > > > > > > > __drop_extent_tree) and check FI_NO_EXTENT for both EX_READ=
 and
> > > > > > > > EX_BLOCK_AGE tree.
> > > > > > > =

> > > > > > > I suffered below test failure, then I bisect to this change.
> > > > > > > =

> > > > > > >  =A0=A0=A0=A0=A0 generic/475=A0 84s ... [failed, exit status =
1]- output mismatch
> > > > > > > (see /
> > > > > > > share/git/fstests/results//generic/475.out.bad)
> > > > > > >  =A0=A0=A0=A0=A0 --- tests/generic/475.out=A0=A0 2025-01-12 2=
1:57:40.279440664 +0800
> > > > > > >  =A0=A0=A0=A0=A0 +++ /share/git/fstests/results//generic/475.=
out.bad 2026-04-17
> > > > > > > 12:08:28.000000000 +0800
> > > > > > >  =A0=A0=A0=A0=A0 @@ -1,2 +1,6 @@
> > > > > > >  =A0=A0=A0=A0=A0=A0 QA output created by 475
> > > > > > >  =A0=A0=A0=A0=A0=A0 Silence is golden.
> > > > > > >  =A0=A0=A0=A0=A0 +mount: /mnt/scratch_f2fs: mount system call=
 failed: Structure
> > > > > > > needs
> > > > > > > cleaning.
> > > > > > >  =A0=A0=A0=A0=A0 +=A0=A0=A0=A0=A0=A0 dmesg(1) may have more i=
nformation after failed mount
> > > > > > > system
> > > > > > > call.
> > > > > > >  =A0=A0=A0=A0=A0 +mount failed
> > > > > > >  =A0=A0=A0=A0=A0 +(see /share/git/fstests/results//generic/47=
5.full for details)
> > > > > > >  =A0=A0=A0=A0=A0 ...
> > > > > > >  =A0=A0=A0=A0=A0 (Run 'diff -u /share/git/fstests/tests/gener=
ic/475.out /
> > > > > > > share/git/
> > > > > > > fstests/results//generic/475.out.bad'=A0 to see the entire di=
ff)
> > > > > > > =

> > > > > > > =

> > > > > > >  =A0=A0=A0=A0=A0 generic/388=A0 73s ... [failed, exit status =
1]- output mismatch
> > > > > > > (see /
> > > > > > > share/git/fstests/results//generic/388.out.bad)
> > > > > > >  =A0=A0=A0=A0=A0 --- tests/generic/388.out=A0=A0 2025-01-12 2=
1:57:40.275440602 +0800
> > > > > > >  =A0=A0=A0=A0=A0 +++ /share/git/fstests/results//generic/388.=
out.bad 2026-04-17
> > > > > > > 11:58:05.000000000 +0800
> > > > > > >  =A0=A0=A0=A0=A0 @@ -1,2 +1,6 @@
> > > > > > >  =A0=A0=A0=A0=A0=A0 QA output created by 388
> > > > > > >  =A0=A0=A0=A0=A0=A0 Silence is golden.
> > > > > > >  =A0=A0=A0=A0=A0 +mount: /mnt/scratch_f2fs: mount system call=
 failed: Structure
> > > > > > > needs
> > > > > > > cleaning.
> > > > > > >  =A0=A0=A0=A0=A0 +=A0=A0=A0=A0=A0=A0 dmesg(1) may have more i=
nformation after failed mount
> > > > > > > system
> > > > > > > call.
> > > > > > >  =A0=A0=A0=A0=A0 +cycle mount failed
> > > > > > >  =A0=A0=A0=A0=A0 +(see /share/git/fstests/results//generic/38=
8.full for details)
> > > > > > >  =A0=A0=A0=A0=A0 ...
> > > > > > >  =A0=A0=A0=A0=A0 (Run 'diff -u /share/git/fstests/tests/gener=
ic/388.out /
> > > > > > > share/git/
> > > > > > > fstests/results//generic/388.out.bad'=A0 to see the entire di=
ff)
> > > > > > > =

> > > > > > > =

> > > > > > >  =A0=A0=A0=A0=A0 F2FS-fs (dm-0): sanity_check_extent_cache: i=
node (ino=3D1761)
> > > > > > > extent
> > > > > > > info [220057, 57, 6] is incorrect, run fsck to fix
> > > > > > > =

> > > > > > > I suspect we may miss any extent updates after we set FI_NO_E=
XTENT in
> > > > > > > __destroy_extent_node(), result in failing in
> > > > > > > sanity_check_extent_cache().
> > > > > > > =

> > > > > > > Can we just relocate f2fs_bug_on(node_cnt) rather than compli=
cated
> > > > > > > change?
> > > > > > > Thoughts?
> > > > > > =

> > > > > > Oh, I overlooked largest extent. How about relocate
> > > > > > f2fs_bug_on(node_cnt) to __destroy_extent_tree?
> > > > > > =

> > > > > > static void __destroy_extent_tree(struct inode *inode, enum ext=
ent_type
> > > > > > type)
> > > > > > =

> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 /* free all extent info belong to =
this extent tree */
> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 node_cnt =3D __destroy_extent_node=
(inode, type);
> > > > > > +=A0=A0=A0=A0=A0=A0 f2fs_bug_on(sbi, atomic_read(&et->node_cnt)=
);
> > > > > =

> > > > >  =A0 =A0=A0=A0=A0/* free all extent info belong to this extent tr=
ee */
> > > > >  =A0 =A0=A0=A0=A0node_cnt =3D __destroy_extent_node(inode, type);
> > > > > =

> > > > >  =A0 =A0=A0=A0=A0/* delete extent tree entry in radix tree */
> > > > >  =A0 =A0=A0=A0=A0mutex_lock(&eti->extent_tree_lock);
> > > > >  =A0 =A0=A0=A0=A0f2fs_bug_on(sbi, atomic_read(&et->node_cnt));=A0=
 <---
> > > > > =

> > > > > Oh, it has already checked node_cnt, so, maybe we can just remove=
 the
> > > > > check in
> > > > > __destroy_extent_node()?
> > > > =

> > > > Yes. BTW, is it correct to remove the call to f2fs_destroy_extent_n=
ode()
> > > > in f2fs_drop_inode()? It seems this call is unnecessary, since
> > > > f2fs_evict_inode() will eventually delete all extent nodes properly.
> > > =

> > > I think it's fine to keep it according to original intention "destroy
> > > extent_tree for the truncation case" introduced from 3e72f721390d
> > > ("f2fs: use extent_cache by default"). It helps the performance w/
> > > in batch extent node release.
> > =

> > Oh, I see. This patch has already been merged into the dev branch. Which
> > of the following approaches would be more appropriate?
> > 1. Drop the current patch from the dev branch, then submit a patch to
> > remove the f2fs_bug_on() in __destroy_extent_node.
> > 2. Send two patches: the first reverts the change, and the second
> > removes the f2fs_bug_on() in __destroy_extent_node().
> =

> It's near the end of merge window, I think we need to keep dev as
> it is, and create another patch to revert previous change and drop
> the f2fs_bug_on() as well, what do you think?

Yes, I just sent a pull request. If the merge patch doesn't break anything,
let's apply a new one only.

> =

> To Jaegeuk, thoughts?
> =

> Thanks,
> =

> > =

> > Thanks
> > Yongpeng,
> > =

> > > =

> > > Thanks,
> > > =

> > > > =

> > > > Thanks
> > > > Yongpeng,
> > > > =

> > > > > =

> > > > > Thanks,
> > > > > =

> > > > > =

> > > > > > =

> > > > > > Thanks
> > > > > > Yongpeng,
> > > > > > =

> > > > > > > =

> > > > > > > Thanks,
> > > > > > > =

> > > > > > > > =

> > > > > > > > Fixes: 3fc5d5a182f6 ("f2fs: fix to shrink read extent node =
in
> > > > > > > > batches")
> > > > > > > > Cc: stable@vger.kernel.org
> > > > > > > > Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> > > > > > > > ---
> > > > > > > >  =A0=A0=A0 fs/f2fs/extent_cache.c | 17 ++++++++++-------
> > > > > > > >  =A0=A0=A0 1 file changed, 10 insertions(+), 7 deletions(-)
> > > > > > > > =

> > > > > > > > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> > > > > > > > index 0ed84cc065a7..87169fd29d89 100644
> > > > > > > > --- a/fs/f2fs/extent_cache.c
> > > > > > > > +++ b/fs/f2fs/extent_cache.c
> > > > > > > > @@ -119,9 +119,10 @@ static bool __may_extent_tree(struct i=
node
> > > > > > > > *inode, enum extent_type type)
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 if (!__init_may_extent_tree(inode, t=
ype))
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > >  =A0=A0=A0 +=A0=A0=A0 if (is_inode_flag_set(inode, FI_NO_EX=
TENT))
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > > +
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 if (type =3D=3D EX_READ) {
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (is_inode_flag_set(inode, FI_NO_E=
XTENT))
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (is_inode_flag_set(in=
ode, FI_COMPRESSED_FILE) &&
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 !f2fs_sb_has_readonly(F2FS_I_SB(inode)))
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > > > > @@ -644,6 +645,8 @@ static unsigned int __destroy_extent_no=
de(struct
> > > > > > > > inode *inode,
> > > > > > > >  =A0=A0=A0 =A0=A0=A0=A0=A0 while (atomic_read(&et->node_cnt=
)) {
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 write_lock(&et->lock);
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (!is_inode_flag_set(inode, FI_NO_=
EXTENT))
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_inode_flag(inode, FI=
_NO_EXTENT);
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 node_cnt +=3D __free_ext=
ent_tree(sbi, et, nr_shrink);
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 write_unlock(&et->lock);
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > @@ -688,12 +691,12 @@ static void __update_extent_tree_rang=
e(struct
> > > > > > > > inode *inode,
> > > > > > > >  =A0=A0=A0 =A0=A0=A0=A0=A0 write_lock(&et->lock);
> > > > > > > >  =A0=A0=A0 -=A0=A0=A0 if (type =3D=3D EX_READ) {
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (is_inode_flag_set(inode, FI_NO_E=
XTENT)) {
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 write_unlock(&et->lock);
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > > > +=A0=A0=A0 if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 write_unlock(&et->lock);
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > > +=A0=A0=A0 }
> > > > > > > >  =A0=A0=A0 +=A0=A0=A0 if (type =3D=3D EX_READ) {
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 prev =3D et->largest;
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dei.len =3D 0;
> > > > > > > =

> > > > > > > =

> > > > > > > =

> > =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
