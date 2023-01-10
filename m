Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EEA6640EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jan 2023 13:53:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFE8E-0002XN-Ge;
	Tue, 10 Jan 2023 12:53:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1pFE8C-0002XH-VB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 12:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/4JyicuY3evhKfwa7lCX5U+XOFdgvqjvFbsTGio2dso=; b=VkUws+fI/EF1QN37BxYFBxBwv0
 BRjLFhJwWgtkQKAsDa5pqwHwzZP0RVE6klqlFPvLNyV3F6QmEvohnogCR6zqmMVUO1QV4t95aM1/s
 mP04nQu1vKeRKyzbNkc+6ZK0WiyFXuY/vQ+P7XMgDiaMa0bht9XPbD51aSsNkwaXSbgQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/4JyicuY3evhKfwa7lCX5U+XOFdgvqjvFbsTGio2dso=; b=V8LJPOJT08nPMtjuwMAetz24ZL
 2ptccMSbAqt1J1O7nNcd1Z9YuNSdRbNh9VKeEmWLzMJHQvqcn1rFrSy/aoE8OjqB5hxDph8vdTMWg
 3BsuNyo0+4Shfo1M1OWhUicN/p5Sf5O5pwkjrn5pzUfgIa4kDUfv/IdI3QBTOQYsKxJI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pFE89-0000ci-Fn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 12:53:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB55D689A8;
 Tue, 10 Jan 2023 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1673355199;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4JyicuY3evhKfwa7lCX5U+XOFdgvqjvFbsTGio2dso=;
 b=v7p1Rm4xJfuzoJC13b36PAT6vkY4FKSn+nx8wtgxLeeo/SpCbaazY59sTSifuo8YXthm0e
 gLvfxD2UJe+Pl29q1mi/iuyQOpbC7aDARhC6tAp6ykyFTDihx+PRR40Mhgk887OlkbcAvP
 xC54UtTr864IjkckxeMOEsX3P1w1BRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1673355199;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4JyicuY3evhKfwa7lCX5U+XOFdgvqjvFbsTGio2dso=;
 b=wXhwMAdYTsQPp3yooTONWtD6VlgYwSgigwjxEANiaDcczdFTQjqtIJviRiOiEw6H2Kah6M
 mI0qrI8JH9fXPcCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9AEFA1358A;
 Tue, 10 Jan 2023 12:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id so3XJL9fvWOBKQAAMHmgww
 (envelope-from <dsterba@suse.cz>); Tue, 10 Jan 2023 12:53:19 +0000
Date: Tue, 10 Jan 2023 13:47:45 +0100
From: David Sterba <dsterba@suse.cz>
To: Alexander Potapenko <glider@google.com>
Message-ID: <20230110124745.GZ11562@suse.cz>
References: <20221121112134.407362-1-glider@google.com>
 <20221121112134.407362-2-glider@google.com>
 <20221122145615.GE5824@twin.jikos.cz>
 <CAG_fn=Waivo=jEEqp7uMjKXdAvqP3XPtnAQeiRfu6ptwPmkyjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG_fn=Waivo=jEEqp7uMjKXdAvqP3XPtnAQeiRfu6ptwPmkyjw@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 10, 2023 at 01:27:03PM +0100, Alexander Potapenko
 wrote: > On Tue, Nov 22, 2022 at 3:56 PM David Sterba <dsterba@suse.cz> wrote:
 > > > > On Mon, Nov 21, 2022 at 12:21:31PM +0100, Alexander [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pFE89-0000ci-Fn
Subject: Re: [f2fs-dev] [PATCH 2/5] fs: affs: initialize fsdata in
 affs_truncate()
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 10, 2023 at 01:27:03PM +0100, Alexander Potapenko wrote:
> On Tue, Nov 22, 2022 at 3:56 PM David Sterba <dsterba@suse.cz> wrote:
> >
> > On Mon, Nov 21, 2022 at 12:21:31PM +0100, Alexander Potapenko wrote:
> > > When aops->write_begin() does not initialize fsdata, KMSAN may report
> > > an error passing the latter to aops->write_end().
> > >
> > > Fix this by unconditionally initializing fsdata.
> > >
> > > Suggested-by: Eric Biggers <ebiggers@kernel.org>
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > Signed-off-by: Alexander Potapenko <glider@google.com>
> >
> > With the fixed Fixes: reference,
> >
> > Acked-by: David Sterba <dsterba@suse.com>
> 
> Hi David,
> 
> I've noticed that the ext4 counterpart of this patch is in the
> upstream tree already, whereas the affs, f2fs, hfs and hfsplus
> versions are not.
> Are they picked via a different tree?

I thought it would go in with the rest of the series but it seems that
the patches are meant to be merged independently, so I'll do the affs
part.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
