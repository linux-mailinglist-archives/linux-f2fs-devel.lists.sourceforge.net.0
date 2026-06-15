Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5VVLDwZMGobNgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:24:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCE687A36
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:24:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Qqdaitux;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=PVerCcxY;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Ce7cCX03;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=T51GH1SA;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C98mCMVD9o1eKXGnEYVjTIsWnXaS7ZXyB+toXQ20+nk=; b=QqdaituxLga/9G1kQ6lt8qPffc
	2BnX2bpX6+ID1vDQ7it6EusLZMkmUaG758BnvE1gzm7SD5AlbhY3Ii5feY4ZsgnJLY2l1e+/xmYAZ
	olYzlvQhny+mswaTPdziN7IBvn0P4WS7yPYgV92LnEhzMaH32JTrrqwNCX0sW5wK7zDE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9Az-0000FL-HK;
	Mon, 15 Jun 2026 15:24:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wZ9Ay-0000FC-E8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sUw57hAfo3ctu0mbRih9ftVfYzKpjB8gtMJX9LZvgwM=; b=PVerCcxYUlQMmnoabSeD5dIg0/
 8xPA+m7OXHoCtUUlM4P7a7z1INJJgKt8vXsDgsf/ZH3RArAVADlP5icPnTozug/o0YYPQfhqdecpL
 bPkQfk26SeLAioVeWxS1AbTalXot50KbqApFN0oGDUgDtayNYTrqZFERvf7GpmdiwwY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sUw57hAfo3ctu0mbRih9ftVfYzKpjB8gtMJX9LZvgwM=; b=Ce7cCX03tfF+BgQQqFKE0iE62r
 UwrANrDMtUWGk42xToLCMMlnwvO+6PGLvgw0Cdbb0jal5bK3dk0UPUKRBQ5mLm583OBEXnIWLnoiO
 3mRwhY+lkMTTNE/UDO2hndhU8Md0B3x289sYl4W3t1/hbNcNFz50J59w2cBLm85N9hKk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9Aw-0001au-B8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:24:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 219B5600AB;
 Mon, 15 Jun 2026 15:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90261F000E9;
 Mon, 15 Jun 2026 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781537068;
 bh=sUw57hAfo3ctu0mbRih9ftVfYzKpjB8gtMJX9LZvgwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=T51GH1SAMjYKFFr66UnuIyZMPmKULXYB8bXqBnCl17LijeUxinND6xoXUVsgEW+0E
 YnxW0UB81bOXT64Ms0I0Ieo4ftxxi6D3gXPnw3L1czNlxg04Mkww1R+6wDXH+r0trr
 uHDhbAKE03cuNT626S0I91oR/tySYjWYJMsXON+PV+nMHTzco2cctzlG7b3wz/1VGz
 ev1f7FpYgoQfXxcYzCgXqJIX9n3T91PYEwN1RX6RG/ZnoUc/dvHy3dHsD6j2XgjoLi
 Nktyvc5zTZleZ0FlmEeeOrYKOkNVZR7D9exz8knt0NBddebybfAjPi+A2K6o6tQhvc
 UzkpnBeyBxfUw==
Date: Mon, 15 Jun 2026 15:24:27 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ajAZK_e2Em415hME@google.com>
References: <20260603154933.16368-1-sam.moelius@trailofbits.com>
 <e7ff2e57-b81f-4195-8e33-062e77b080fe@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7ff2e57-b81f-4195-8e33-062e77b080fe@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/15, Chao Yu wrote: > On 6/3/26 23:49, Samuel Moelius
 wrote: > > Inline dentry conversion copies names out of the inline dentry
 area > > before checking that each recorded name length fits in the [...]
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
X-Headers-End: 1wZ9Aw-0001au-B8
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate inline dentry name lengths
 before conversion
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
Cc: open list <linux-kernel@vger.kernel.org>,
 Samuel Moelius <sam.moelius@trailofbits.com>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:sam.moelius@trailofbits.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CCCE687A36

On 06/15, Chao Yu wrote:
> On 6/3/26 23:49, Samuel Moelius wrote:
> > Inline dentry conversion copies names out of the inline dentry area
> > before checking that each recorded name length fits in the available
> > filename slots.
> > 
> > A corrupted image can therefore make the conversion path read past
> > the inline filename storage while building the regular dentry block.
> > 
> > Validate each inline dentry name length against the inline filename
> > area before copying it.
> > 
> > Assisted-by: Codex:gpt-5.5-cyber-preview
> > Signed-off-by: Samuel Moelius <sam.moelius@trailofbits.com>
> > ---
> >  fs/f2fs/inline.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > index 7aabfc9b43cb..4584dfbe3fb8 100644
> > --- a/fs/f2fs/inline.c
> > +++ b/fs/f2fs/inline.c
> > @@ -507,6 +507,10 @@ static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
> >  			bit_pos++;
> >  			continue;
> >  		}
> > +		if (unlikely(le16_to_cpu(de->name_len) > F2FS_NAME_LEN ||
> > +			     bit_pos + GET_DENTRY_SLOTS(le16_to_cpu(de->name_len)) >
> > +			     d.max))
> > +			return -EFSCORRUPTED;
> 
> 	err = -EFSCORRUPTED;
> 	goto punch_dentry_pages;

Applied with it.

> 
> Thanks,
> 
> >  
> >  		/*
> >  		 * We only need the disk_name and hash to move the dentry.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
