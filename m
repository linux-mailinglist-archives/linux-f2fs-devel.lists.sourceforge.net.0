Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD8BJvm0sWnbEgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 19:31:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB20268A22
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 19:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHmqRzKAvYDB/HTUWCrzSntmQhdspYTnPK2/l6UUre0=; b=W/3tyD+abmu2MKfvxkmwTr6xze
	vBfaDSCjw2qDb0MULrIK5IoHt+6GNUPHGWFnsVueCiXP8tG+yFlmUNCEA7kTiF2BfiBgoNx3GTtrR
	zVOhaOw2x9+u9H0UhsHie32mIFY+swlxkYKh21OGpMEQFWA2T/fZXCtl/MxYDzJgsilY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0OKs-0007gx-Si;
	Wed, 11 Mar 2026 18:31:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1w0OKq-0007gq-TE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 18:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YFqJZ6fAKQNexL2ZBTP0LT1zetC88wc99m3UpRktzc4=; b=NJXhbcWg2R0s3VOAtqst3DRJUQ
 JfdMm6FdHUHem6qspCsJQHdMy6fMFczHT13AmBJFp/fla+Vaw2lkdRC1kZGWLJXUb83c3tNLZA9Jf
 gsvvt+p+jCicqomGWR9u62IbE5ixEK+xkFdNWNWNOXzQQSh0ir1/gacaeZfF+WoEOKqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YFqJZ6fAKQNexL2ZBTP0LT1zetC88wc99m3UpRktzc4=; b=HfvVAAhzX2vvn1oy0EfjXWnPKv
 ukxrvvZRzNGVId8D9Mb04ud0mnrsWecvF3rcq88t2qpvqOXWoZnfzu3dcYVKTVJ69COZdx3qdgnhF
 m2zuWoGFUbXWW+veev0wmXV3HSxJY9JZbC4sswfOBU/pdknfwaPq+oIAoi5H7bTcr6jY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0OKq-0007x7-DG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 18:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 949DF60142;
 Wed, 11 Mar 2026 18:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFF0C4CEF7;
 Wed, 11 Mar 2026 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773253857;
 bh=rlRgR6lyh1uNkqFW5fSivaqlwDJLiTjIxp61rUN9zNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ueRMTwc+7KmFsETyL1UnW66wclCXQq757hwltKhmK7I3RiY3vUS3Tuu9yiZMyVglq
 /ZXL//XhNUPgYjmc9agxZFtt9R2Xdnl3DDEQYOsXCcntXqgLIMseW+QI7i9zoDvY6f
 nWIYCYaOwi+WLNPRtsFsxv7PcAORRODVE7bb7mDZToO1ziLgg2ap7J1IRK7R7O/uyX
 n4X8BTcyJM1ZHMpiNmW5zIVvWVVEFzB2ITGaHprmD+SZc4GqRn+umPej56cYMm696y
 Ei0Erth0T5gqyFimQ80f5rX2SW2WPgYexZI1qfUI6Jm5BCvTKg7gUgWMF1LjZwfqqI
 FYpN4o5v2qT7A==
Date: Wed, 11 Mar 2026 18:30:55 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <abG03yz64OhRossb@google.com>
References: <2026022422-robotics-conform-9b68@gregkh>
 <dd4b275e-4db9-4951-9db2-9eaf4aef48ec@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd4b275e-4db9-4951-9db2-9eaf4aef48ec@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/09, Chao Yu wrote: > On 2/24/26 09:04,
 Greg Kroah-Hartman
 wrote: > > f2fs_convert_inline_inode() holds the page lock of the inline
 data page > > and then calls f2fs_lock_op(), which acquires cp_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0OKq-0007x7-DG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential deadlock in
 f2fs_convert_inline_inode
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:gregkh@linuxfoundation.org,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: CDB20268A22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03/09, Chao Yu wrote:
> On 2/24/26 09:04, Greg Kroah-Hartman wrote:
> > f2fs_convert_inline_inode() holds the page lock of the inline data page
> > and then calls f2fs_lock_op(), which acquires cp_rwsem in read mode.
> > At the same time, f2fs_write_checkpoint() can acquire cp_rwsem in write
> > mode and then will wait for page locks, like during
> > f2fs_write_node_pages() or data flushing, leading to a deadlock.
> 
> - f2fs_convert_inline_inode		- f2fs_write_checkpoint()
>  - f2fs_grab_cache_folio page #0
> 					 - block_operations
> 					  - f2fs_lock_all
>  - f2fs_lock_op
> 					  - f2fs_sync_node_pages
> 					   - flush_inline_data
> 					    - f2fs_filemap_get_folio page #0

flush_inline_data -> f2fs_filemap_get_folio(FGP_LOCK|FGP_NOWAIT) does not
wait for the lock, right?

> 
> It seems true, although I didn't hit such deadlock.
> 
> To Jaegeuk, what do you think?
> 
> > 
> > Fix this by acquiring the lock_op before locking the page. This ensures
> > the correct lock ordering, op before page, and avoids the deadlock.
> > 
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > Cc: Chao Yu <chao@kernel.org>
> > Cc: stable <stable@kernel.org>
> > Assisted-by: gkh_clanker_2000
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > 
> > This issue was found by running a tool to compare a past kernel CVE to
> > try to find any potential places in the existing codebase that was
> > missed with the original fix.  I do not know if this patch or text
> > really is correct, but the code paths seems sane.
> > 
> > Note that the majority of the changelog text came from an untrusted and
> > experimental LLM model that is known for making crap up.  So it might be
> > totally lying here, and if so, I am very sorry for wasting anyone's time
> > and I'll just go back to running this on code that I actually understand
> > and know how to verify myself, but I figured it was worth at least
> > asking you all about it.
> > 
> > fs/f2fs/inline.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > index 0a1052d5ee62..98bc920a4f35 100644
> > --- a/fs/f2fs/inline.c
> > +++ b/fs/f2fs/inline.c
> > @@ -232,12 +232,14 @@ int f2fs_convert_inline_inode(struct inode *inode)
> >  	if (err)
> >  		return err;
> >  
> > -	folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
> > -	if (IS_ERR(folio))
> > -		return PTR_ERR(folio);
> > -
> >  	f2fs_lock_op(sbi, &lc);
> >  
> > +	folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
> > +	if (IS_ERR(folio)) {
> > +		f2fs_unlock_op(sbi, &lc);
> > +		return PTR_ERR(folio);
> > +	}
> > +
> 
> It will be better to adjust the unlock order in between cp_rwsem and folio lock?
> 
> out:
> 	f2fs_folio_put(folio, true);
> 	f2fs_unlock_op(sbi, &lc);
> 
> Thanks,
> 
> >  	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
> >  	if (IS_ERR(ifolio)) {
> >  		err = PTR_ERR(ifolio);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
