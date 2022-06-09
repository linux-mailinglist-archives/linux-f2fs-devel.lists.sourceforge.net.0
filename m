Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651454580A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 01:09:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzRHb-0006lY-N9; Thu, 09 Jun 2022 23:09:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dsterba@suse.cz>)
 id 1nzRHY-0006lJ-8X; Thu, 09 Jun 2022 23:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qJ6CI0mpfkDIaS/pnwJC/3BIuCFzValbcslJLDqCmdg=; b=WeVXkdjxK13HHqesKCgdhgYkSE
 IXLJnrrb/51jpYZ7eVYVuLMp5lhFssHygnwWDRDfPcA0m8aHKS24rAHrR2xsxYKP8+0EFAWyCjhcx
 j+tkHjvsrZaGVqcyDscczaaSNtAeJyGkPCqd1P3lA16ipsYVhNneuRadqYYkOWUIOhto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qJ6CI0mpfkDIaS/pnwJC/3BIuCFzValbcslJLDqCmdg=; b=hTLOWqlGRSbo4oU4wFagMg2XI7
 TakKHLmiwvmdAYvbgGfL0xqGPD74hNUXp7jVk+MJkCk+aq4wp6i8ja+iD7moNhzPlE3edswLx0RbI
 qIkkWXPOP8i5K5hAjl6LeYPCQjAycAMxj0dC2TMkGF7++JBUEKlTS2tBMPe3uxftAd7o=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nzRHV-0001pk-Jc; Thu, 09 Jun 2022 23:09:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A49541FF09;
 Thu,  9 Jun 2022 23:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654816172;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qJ6CI0mpfkDIaS/pnwJC/3BIuCFzValbcslJLDqCmdg=;
 b=I4/06b2ltiKrPbL7GgKqUfyrBDeCyX3UBUG59EJr4ULzJeSHMklpbChcFfJ1kbSeucBXix
 La6qOv94FBGz6zARxy9vvZ/rfr+o4fJAO1+4sOg84lO5ESeVeDRRH4GNx2iw82Lzfy4RBp
 n/81rXgBPEK2N99/Wl5n9BN9FjCnnSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654816172;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qJ6CI0mpfkDIaS/pnwJC/3BIuCFzValbcslJLDqCmdg=;
 b=L3W4XRXz86YAqVEeWGz5ZqCwllS9CYkUvRzkZLgLEjLQjJDb2qGw16RPUqD736ufsddkqi
 GP6X1OhCsdJk3BBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31C9113456;
 Thu,  9 Jun 2022 23:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kuItC6x9omLpJgAAMHmgww
 (envelope-from <dsterba@suse.cz>); Thu, 09 Jun 2022 23:09:32 +0000
Date: Fri, 10 Jun 2022 01:05:01 +0200
From: David Sterba <dsterba@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20220609230501.GY20633@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Matthew Wilcox <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-aio@kvack.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-13-willy@infradead.org>
 <20220609163323.GV20633@twin.jikos.cz>
 <YqIwjEO1a0Sbxbym@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqIwjEO1a0Sbxbym@casper.infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 09, 2022 at 06:40:28PM +0100,
 Matthew Wilcox wrote:
 > On Thu, Jun 09, 2022 at 06:33:23PM +0200, David Sterba wrote: > > On Wed,
 Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wr [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nzRHV-0001pk-Jc
Subject: Re: [f2fs-dev] [PATCH v2 12/19] btrfs: Convert btrfs_migratepage to
 migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ntfs-dev@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, dsterba@suse.cz, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 09, 2022 at 06:40:28PM +0100, Matthew Wilcox wrote:
> On Thu, Jun 09, 2022 at 06:33:23PM +0200, David Sterba wrote:
> > On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
> > > Use filemap_migrate_folio() to do the bulk of the work, and then copy
> > > the ordered flag across if needed.
> > > 
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > 
> > Acked-by: David Sterba <dsterba@suse.com>
> > 
> > > +static int btrfs_migrate_folio(struct address_space *mapping,
> > > +			     struct folio *dst, struct folio *src,
> > >  			     enum migrate_mode mode)
> > >  {
> > > -	int ret;
> > > +	int ret = filemap_migrate_folio(mapping, dst, src, mode);
> > >  
> > > -	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
> > >  	if (ret != MIGRATEPAGE_SUCCESS)
> > >  		return ret;
> > >  
> > > -	if (page_has_private(page))
> > > -		attach_page_private(newpage, detach_page_private(page));
> > 
> > If I'm reading it correctly, the private pointer does not need to be set
> > like that anymore because it's done somewhere during the
> > filemap_migrate_folio() call.
> 
> That's correct.  Everything except moving the ordered flag across is
> done for you, and I'm kind of tempted to modify folio_migrate_flags()
> to copy the ordered flag across as well.  Then you could just use
> filemap_migrate_folio() directly.

Either way it works for me. If it would mean an unsafe change in folios
or complicate other code I'm fine with the migration callback that
does additional work for btrfs that could be changed later.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
