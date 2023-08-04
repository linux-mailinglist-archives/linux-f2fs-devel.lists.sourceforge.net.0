Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8400976F90E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 06:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRmdg-00067S-0R;
	Fri, 04 Aug 2023 04:42:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qRmdZ-00067M-Q8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 04:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QoZhwhwxP+ujyhKVgT7oNV0UqypRIfalkfzbu158U/g=; b=j8wHbPIJtJpIpUhmHpqb8JFsyR
 qTVxUgu+9gPnqneFDhRTE81BGyQIPC0bJy5cCNz7dJgOSZWp70EMUFyOTsmbUFTD44fagIg28xATE
 yzYRDIQGbZG634tQT66vC4L/3nzAqVWRjLBl9kq2PbOGLT5tBPjIzOfA4Q5BUxL7H0TY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QoZhwhwxP+ujyhKVgT7oNV0UqypRIfalkfzbu158U/g=; b=RIv+sXekSWLgTJlowzoXrtmInC
 0J5kndJJwSAqfimH38Ut2g7h3P5qxkDepmU+H4Tox26g9IMDz1/UaAs0+godHCvP9wQALc0S6NpGm
 gkrJ7CKwhJOsVFCPXv2ssrpWuCvtNUdK9G7gIq+3g7uhLw2/4pzPMT72uO1qhcJPW+Wc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRmdZ-00Cfg7-4G for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 04:42:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7710461F25;
 Fri,  4 Aug 2023 04:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2CAC433C7;
 Fri,  4 Aug 2023 04:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691124118;
 bh=483xcLasT3cOTrxUXGXtibomqh1U7dTQNKUfCSr0aBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5REp5QCvmmZ5NkRVkpLVzwl0MiA0bI+SR/XdKPOcj8jqYI9WZirVeVplh/2b8i1Q
 roMrmCG242fT9QQP/B2bahS2aNCanlpWUGftxZuIbblqajP7uYnt3CooErFske5t4g
 R+QR6PwE4Ep8t+ytmnWsxvrLeLG1icA6PKo9AjEUwZ7LH1oZ3oFAY/4nXil3iX4+vA
 L4LoulTP72IR06STRpxXRzAZLIvnHt4E6Bo1COwKnQtJCZ5EDh/GyiRXsvVHnXfgbH
 5DVV3KdP4hb0TvqM8L/+Dl1U8wbW3hbkY0Df0x54CEFX47+EdJC3edb41g3+Up+alm
 3viLGtON5P+0Q==
Date: Thu, 3 Aug 2023 21:41:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230804044156.GB1954@sol.localdomain>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
 <20230729042048.GB4171@sol.localdomain> <875y5w10ye.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875y5w10ye.fsf@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 03, 2023 at 01:37:45PM -0400, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > > On Thu,
 Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote: > > [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRmdZ-00Cfg7-4G
Subject: Re: [f2fs-dev] [PATCH v4 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 03, 2023 at 01:37:45PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
> >>   - In __lookup_slow, either the parent inode is read locked by the
> >>     caller (lookup_slow), or it is called with no flags (lookup_one*).
> >>     The read lock suffices to prevent ->d_name modifications, with the
> >>     exception of one case: __d_unalias, will call __d_move to fix a
> >>     directory accessible from multiple dentries, which effectively swaps
> >>     ->d_name while holding only the shared read lock.  This happens
> >>     through this flow:
> >> 
> >>     lookup_slow()  //LOOKUP_CREATE
> >>       d_lookup()
> >>         ->d_lookup()
> >>           d_splice_alias()
> >>             __d_unalias()
> >>               __d_move()
> >> 
> >>     Nevertheless, this case is not a problem because negative dentries
> >>     are not allowed to be moved with __d_move.
> >
> > Isn't it possible for a negative dentry to become a positive one concurrently?
> 
> Do you mean d_splice_alias racing with a dentry instantiation and
> __d_move being called on a negative dentry that is turning positive?
> 
> It is not possible for __d_move to be called with a negative dentry for
> d_splice_alias, since the inode->i_lock is locked during __d_find_alias,
> so it can't race with __d_instantiate or d_add. Then, __d_find_alias
> can't find negative dentries in the first place, so we either have a
> positive dentry, in which case __d_move is fine with regard to
> d_revalidate_name, or we don't have any aliases and don't call
> __d_move.
> 
> Can you clarify what problem you see here?
> 

I agree that negative dentries can't be moved --- I pointed this out earlier
(https://lore.kernel.org/linux-fsdevel/20230720060657.GB2607@sol.localdomain).
The question is whether if ->d_revalidate sees a negative dentry, when can it
assume that it remains a negative dentry for the remainder of ->d_revalidate.
I'm not sure there is a problem, I just don't understand your explanation.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
