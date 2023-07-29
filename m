Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5700767C0F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jul 2023 06:18:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPbPS-00034W-3t;
	Sat, 29 Jul 2023 04:18:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qPbPQ-00034Q-Qo
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W2Cm8TVs+K/RD3BiTajPfIBZkK47gghPIcLMMX97VHg=; b=Z8jdMOtxvSha2iTU1nh6Fstv+T
 uOtKyUL3IVwOzebwpMNZwXI54SFsKk+9OQFwhmuhLgyfjWswblX3prNUE0B/sVBtxSj2jREnsVY18
 o5fZ1LJ/JwW9ILAH2XdyBLqF8QaVeQigQy3RVcxFDDXIxypvqvsDIdZQvnDCjcAOYeSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W2Cm8TVs+K/RD3BiTajPfIBZkK47gghPIcLMMX97VHg=; b=AET+EfyqUchvr7UP5POEDdbGDM
 64baZIEYL8S7NNwCdtnlubGrdACp5J5msjY7dOH0pH1+1/dVDNZr5P+T7KMNu/X3A1uq+blSSLXc5
 rIMl9Sf0mlkL6ssZbxURahlpaBZThW3VBOC04T+jQCkvOXCHQgvv7NABxkqBwSUWyYzQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPbPK-0005NC-BG for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:18:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D905660A5D;
 Sat, 29 Jul 2023 04:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7580C433C7;
 Sat, 29 Jul 2023 04:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690604291;
 bh=KQBZTd1S0knxsGiSweS0mSJsa3IrgD8+KiGKrRwjDpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzTepYHLCqjPnb04DG+lQ/wa+C7QCxmCzeepM4xWu7HFaFHnXwaqMArNTKsLWVTDf
 clYhanByTkW5HO+MBCicjRqObbYeuiIDjXz8nOWyUKhHhrUcEk0vmDjU3T/8QIpJAx
 FyFhIzFZzkaIpE1BKfAxqTOlzvdy3duJSmOf0DfIftTBjp6uMCBn1g28waTGOR0ffz
 X439aHHgq0bDLUjyA4+8Y/+cmbZzdZ/U4KUoDvz00xMswfnK64x16BHt+hVtjeg3uK
 y08JiKTf+0ZH2gfo/tLny4Wl41AU8Y5O5qiofOu0sY4U9tJ32b/F9+3oXNKHoj4Fdu
 7zqOMC5HzOIjw==
Date: Fri, 28 Jul 2023 21:18:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230729041809.GA4171@sol.localdomain>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
 <20230728-beckenrand-wahrlich-62d6b0505d68@brauner>
 <87r0os139h.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r0os139h.fsf@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 28, 2023 at 11:09:46AM -0400, Gabriel Krisman
 Bertazi wrote: > Christian Brauner <brauner@kernel.org> writes: > > > On Thu, 
 Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote: [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPbPK-0005NC-BG
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 28, 2023 at 11:09:46AM -0400, Gabriel Krisman Bertazi wrote:
> Christian Brauner <brauner@kernel.org> writes:
> 
> > On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
> 
> >
> > Wouldn't it make sense to get rid of all this indentation?
> 
> I'm ok with making this change. I'll wait for more reviews and Eric
> before sending a new version with this done.
> 
> Thanks!
> 

Well, the issue is that with patch 4, all the 'return 1;' would need to change
to 'return fscrypt_d_revalidate(dentry, flags);'.

A helper function could be used, though, if you prefer:

static int generic_ci_d_revalidate(struct dentry *dentry,
				   const struct qstr *name, unsigned int flags)
{
	if (!ci_d_revalidate(dentry, name, flags))
		return 0;
	return fscrypt_d_revalidate(dentry, flags);
}

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
