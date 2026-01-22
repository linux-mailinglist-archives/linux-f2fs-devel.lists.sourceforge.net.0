Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AArSN3FFcmlCgQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 16:42:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C469160
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 16:42:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlxw1ZfZog3I6CBOZCMVS+RtwYAKVMARMmSR4pTOQvA=; b=QoR/q0gqfvLfKw3fKy7C1jr8H0
	j3gTxD3itdi+rCfgf/ig9cmzQBSQv5y7NSQoyA//WlkMe0l55x3JCS4fbQmtN8ffs+ZkakdHuhsK/
	uC1WXpoj5iXxPZ1VIaqND71WGV081lf13lzAk4MYeOtlOd5wstAMIU4Luov5hnEVYNbs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viwpK-0007F9-8F;
	Thu, 22 Jan 2026 15:42:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1viwpI-0007F3-Do
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 15:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eXgjnBxZ8BrNqn4Sk6A4xpE60v2fmF+nX+2I0eOLLCg=; b=VMj/6HFdu1NkdpEfU9kBTeLP5Q
 HtJXG2yb4CP1pDaHpcApQkqzIWrsnV3rVcsMYKv/NtKsd28HYMtXsV/Z3R5M9Mx2xl/+FCttM84MD
 ArfmM/6/frdukAPR4/R2lXOSw8fVkN+noJOJE3gqflbURLRoACjAg+y3g82cDTcCMGjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eXgjnBxZ8BrNqn4Sk6A4xpE60v2fmF+nX+2I0eOLLCg=; b=OURCHeS3E73cScOsTyNnRpuFSV
 7JhIg8oJ2REQNVGmNz6zJsvGvpU1HLnwf7JcjmaCsKSmhQDT5wJRmuqo0ST6eiFOK1OORebgzYrOX
 hZKxmA+AE7CBAWMYgS0X+P1LUl/vgOtlMUGIdPw6FvEBd6b50+IGhWOkACKea+lOQ0iw=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1viwpH-0007mv-Rm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 15:42:28 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6FE955BCD7;
 Thu, 22 Jan 2026 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769096536;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eXgjnBxZ8BrNqn4Sk6A4xpE60v2fmF+nX+2I0eOLLCg=;
 b=j6JxqPzePV1v3VMwls0tzTsZjgdG9emkov+yXkAfgU/rTXQf8T3zUIk9y6kwTpmIwFH+jg
 +tGTZOAzNSt5DmyeGJlQYLKpb2hgbWczQo2u8RmaFCK8Kyk9Ad8W0Ksxyx6AoNHndiNUd3
 pgQ09os0+EUkMbgwfaOlHtEStLw+2xM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769096536;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eXgjnBxZ8BrNqn4Sk6A4xpE60v2fmF+nX+2I0eOLLCg=;
 b=0iqPGW1agNVaVnQmF+2mMFaHz5jf38AXI7KkERuGiInWYYKzTGrVODUWzChReQtemzPfna
 a8MSgMwRXxKctUBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=j6JxqPze;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=0iqPGW1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769096536;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eXgjnBxZ8BrNqn4Sk6A4xpE60v2fmF+nX+2I0eOLLCg=;
 b=j6JxqPzePV1v3VMwls0tzTsZjgdG9emkov+yXkAfgU/rTXQf8T3zUIk9y6kwTpmIwFH+jg
 +tGTZOAzNSt5DmyeGJlQYLKpb2hgbWczQo2u8RmaFCK8Kyk9Ad8W0Ksxyx6AoNHndiNUd3
 pgQ09os0+EUkMbgwfaOlHtEStLw+2xM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769096536;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eXgjnBxZ8BrNqn4Sk6A4xpE60v2fmF+nX+2I0eOLLCg=;
 b=0iqPGW1agNVaVnQmF+2mMFaHz5jf38AXI7KkERuGiInWYYKzTGrVODUWzChReQtemzPfna
 a8MSgMwRXxKctUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DF1F13533;
 Thu, 22 Jan 2026 15:42:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0Tn4DlhFcmlzbQAAD6G6ig
 (envelope-from <dsterba@suse.cz>); Thu, 22 Jan 2026 15:42:16 +0000
Date: Thu, 22 Jan 2026 16:42:15 +0100
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260122154215.GV26902@suse.cz>
References: <20260122082214.452153-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-1-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.21
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:21:56AM +0100, Christoph Hellwig
 wrote: > Hi all, > > this series has a hodge podge of fsverity enhances that
 I looked into as > part of the review of the xfs fsverity suppo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1viwpH-0007mv-Rm
Subject: Re: [f2fs-dev] fsverity cleanups,
 speedup and memory usage optimization v2
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
Reply-To: dsterba@suse.cz
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[suse.cz:server fail,lists.sourceforge.net:server fail,suse.com:server fail];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER(0.00)[dsterba@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	HAS_REPLYTO(0.00)[dsterba@suse.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dsterba@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:replyto,suse.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 643C469160
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:21:56AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series has a hodge podge of fsverity enhances that I looked into as
> part of the review of the xfs fsverity support series.
> 
> The first part calls fsverity code from VFS code instead of requiring
> boilerplate in the file systems.  The first patch fixes a bug in btrfs
> as part of that, as btrfs was missing a check.  An xfstests
> test case for this was submitted already.
> 
> The middle part optimizes the fsverity read path by kicking off readahead
> for the fsverity hashes from the data read submission context, which in my
> simply testing showed huge benefits for sequential reads using dd.
> I haven't been able to get fio to run on a preallocated fio file, but
> I expect random read benefits would be significantly better than that
> still.
> 
> The last part avoids the need for a pointer in every inode for fsverity
> and instead uses a rhashtable lookup, which is once per read_folio or
> ->readahead invocation and for for btrfs another time for each bio
> completion.  Right now this does not increse the number of inodes in
> each slab, but for ext4 we are getting very close to that (within
> 16 bytes by my count).
> 
> Changes since v1:
>  - reorder to keep the most controversial part last
>  - drop moving the open handling to common code (for now)
>  - factor the page cache read code into common code
>  - reduce the number of hash lookups
>  - add a barrier in the fsverity_active that pairs with the cmpxchg
>    that sets the inode flag.
> 
> Diffstat:
>  fs/attr.c                    |   12 ++

For the btrfs changes

>  fs/btrfs/btrfs_inode.h       |    4 
>  fs/btrfs/extent_io.c         |   37 +++++---
>  fs/btrfs/inode.c             |   13 ---
>  fs/btrfs/verity.c            |   11 --

Acked-by: David Sterba <dsterba@suse.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
