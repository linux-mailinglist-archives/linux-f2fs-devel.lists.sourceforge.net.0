Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C26171A2A8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 17:27:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4kDS-0000iF-2A;
	Thu, 01 Jun 2023 15:27:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4kDR-0000i8-Ba
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bzP3jLe8H8GOVTU+gtWIF9QQ1w/ZlpecHavzqINdb94=; b=fUTqPpGVMXEfpH0Vqd8Ut2F8nJ
 kIF8ji9bpqSQ01VwzH+vwU3fMWVQ7/U1hEHLxMiuoeo5Z3TUor1dNU4Cdvq7roFGQdVfwg47XMogV
 uYE7D+Xt4VFmBbskfXb1rIChClmtzS6mwAdUNHT8QwD588zwU73q+haLvJydTs+OCWbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bzP3jLe8H8GOVTU+gtWIF9QQ1w/ZlpecHavzqINdb94=; b=imLsmwMcVChU1LPVUfcBpmBfIS
 CwHXCOnYXAZTsqYUaWEnPb1OO2nDj91oooV0vVZdbjVCIK1lu0JbySZEnei8aTFMmYOTKG+RSA5fL
 tmaM++p5MEAAg981whQYNNITp05uoQ/HDpRcpqBZuV8++KCPnNkAmhP4GdcGDaXa4kHo=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4kDQ-0000Tj-S9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:27:53 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A484321999;
 Thu,  1 Jun 2023 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685633266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzP3jLe8H8GOVTU+gtWIF9QQ1w/ZlpecHavzqINdb94=;
 b=gOv8ln8aI+gXFZjWVdmCA8Wjxd4LICDM5AcA4HSkflUYb41Mcds6Sig/+gvw1r+us6LFoO
 kVxojpvhhIe6pB3ye46OJCnKyH8RZgj7hBe/YL9nHIGq4Dz3fwiNpUvsP1RR+d1U0PwiX7
 f67hxyD7bPdnQhqhQaCuY/jq4Qu3bLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685633266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bzP3jLe8H8GOVTU+gtWIF9QQ1w/ZlpecHavzqINdb94=;
 b=2SzoaO5XBuvNM4t9ZY5UOUFL7l/socW8dcuNJwrzQ6bLiNuaC9FS97mPz/t3+MWR1OT01Q
 UvfkwX48LkI2rvCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9558513441;
 Thu,  1 Jun 2023 15:27:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qntwJPK4eGSLbAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 15:27:46 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 18AC5A0754; Thu,  1 Jun 2023 17:27:46 +0200 (CEST)
Date: Thu, 1 Jun 2023 17:27:46 +0200
From: Jan Kara <jack@suse.cz>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20230601152746.kqykcztndxvxbbf7@quack3>
References: <20230601104525.27897-1-jack@suse.cz>
 <20230601105830.13168-1-jack@suse.cz>
 <20230601145222.GB1069561@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601145222.GB1069561@mit.edu>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 01-06-23 10:52:22, Theodore Ts'o wrote: > On Thu, Jun
 01, 2023 at 12:58:21PM +0200, Jan Kara wrote: > > Remove locking of moved
 directory in ext4_rename2(). We will take care > > of it in VFS i [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4kDQ-0000Tj-S9
Subject: Re: [f2fs-dev] [PATCH v2 1/6] ext4: Remove ext4 locking of moved
 directory
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 01-06-23 10:52:22, Theodore Ts'o wrote:
> On Thu, Jun 01, 2023 at 12:58:21PM +0200, Jan Kara wrote:
> > Remove locking of moved directory in ext4_rename2(). We will take care
> > of it in VFS instead. This effectively reverts commit 0813299c586b
> > ("ext4: Fix possible corruption when moving a directory") and followup
> > fixes.
> 
> Remind me --- commit 0813299c586b is not actually causing any
> problems; it's just not fully effective at solving the problem.  Is
> that correct?

Yes, correct.

> In other words, is there a rush in trying to get this revert to Linus
> during this cycle as a regression fix?
> 
> I think the answer is no, and we can just let this full patch series
> go in via the vfs branch during the next merge window, but I just
> wanted to make sure.

Exactly, that's my plan as well.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
