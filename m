Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDQAI1pmu2lVjgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 03:58:34 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F12C539A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 03:58:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZrK7ytmS0RZ5aj5JMxXcY4ApRdwGnv6jYMIZxmnTEM=; b=BmL2xJx9W8cyNHiXtNTodwct/d
	YMJA/k1ulw+H33wP6zv7/S1igpN8plA/GWg5OOjlNMRyIP79kRbZ3d9jQx6jWXgejX28k7MtGA3wJ
	8YdFP5/9V8AYUvVkPfaz7bbNJ2wQPRIPkL+fs/bH4hTy/bxHcWbbbMZqNT2ebAeTvgDs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w33aa-0006c2-JL;
	Thu, 19 Mar 2026 02:58:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1w33aZ-0006bX-4D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 02:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OrIcqKv691Sb492rnWQe4KOY615xGNniNK4GOfoXc7s=; b=GIZgnrm6oJkH7Bia/PUXDK9ECc
 T00jejJR+MEaK+67CE1dUJMuMST1G7FvDLwyp1jwzXuUaY9COR45mDyK6P5GWOfjHbt3OaGe/VdrT
 UEcK+bVxaoAFvuYMxZzsqr8YgvgMWcb/TyEGsyesLKcmNlsCuL3/nL4pZR9gHq5rjUt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OrIcqKv691Sb492rnWQe4KOY615xGNniNK4GOfoXc7s=; b=Xiqek27zc9zEY1We4FWZDqjY4h
 zpEpQBCYloNzftwd3eUyPk+ZJNk7TQjU7MLaV0SmcAK1tQE0/JXz2gcbmEdLWwk8sxST1fU8MtQqp
 4/CSdtdDCgmo6/RUYP+mnx6y7PXxf9Qva/trUA7AxPV0So1hpW6Y81pcHvJ4t1aaWDNU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w33aZ-0008RG-Ik for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 02:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 35A2943F18;
 Thu, 19 Mar 2026 02:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C89C2BCAF;
 Thu, 19 Mar 2026 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773889093;
 bh=DD776qvrhptS/c7ZpCzpmp7GE9bv7ai0gPDAUetaFGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BC6VFDqlL6b7/0amaL5oGAFRPP3oJLpv4GENFaEB4Fyt9jcOPVyQSd9vJnktoL+te
 7B4Z6SOT/JhqE8pozRwZ4Plcly1bmCHCqooT8OD1i/JR9fhmABcGM3RPJhz+PQu+PC
 5tBJLxSZq1bmh9nnsoOJSh5TVtXrW7voZOrzIupQrdOg7cS8XHBB/0ki00VEDsNdGE
 Raka3+PRDqSW3y7a12eCtvXF5K95u9aftfcJzrGl+rB1XlnKcdVsRizAucftp3grb4
 DlQbXBjsre11VvKAJE0+Us02MsTz4NkumfCUt7WKNwldhkAyhwuHI9e+6oJlsV5E5G
 wF9VKxOoP/Mnw==
Date: Wed, 18 Mar 2026 19:57:10 -0700
To: Cen Zhang <zzzccc427@gmail.com>
Message-ID: <20260319025710.GA357817@sol>
References: <20260319022335.3213311-1-zzzccc427@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319022335.3213311-1-zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 19, 2026 at 10:23:35AM +0800, Cen Zhang wrote:
 > fi->i_flags can be read by f2fs_update_inode() in the writeback path, >
 f2fs_getattr(), and f2fs_fileattr_get() without holding inode_lock [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w33aZ-0008RG-Ik
Subject: Re: [f2fs-dev] [PATCH] f2fs: annotate data races around fi->i_flags
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baijiaju1990@gmail.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 311F12C539A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 10:23:35AM +0800, Cen Zhang wrote:
> fi->i_flags can be read by f2fs_update_inode() in the writeback path,
> f2fs_getattr(), and f2fs_fileattr_get() without holding inode_lock or
> fi->i_sem, while it can be concurrently written by
> f2fs_setflags_common(), set_compress_context(), and
> f2fs_disable_compressed_file() under inode_lock and/or fi->i_sem.
> 
> This is a data race as defined by the LKMM.  Use READ_ONCE() on the
> read side and WRITE_ONCE() on the write side to ensure proper marking
> of the concurrent accesses.
> 
> Fixes: 360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4 i_flags")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Is that really the correct Fixes commit?  I don't see what it has to do
with this issue.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
