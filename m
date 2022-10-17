Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD90600E80
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 14:03:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okOpz-0005Ss-1b;
	Mon, 17 Oct 2022 12:03:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1okOpx-0005Si-3G;
 Mon, 17 Oct 2022 12:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H9rmmj8x9/pRGSP0rhWzAN2XdXyBU8aire6+hcOWaqg=; b=gcXY6vBh15pHoSW5GarnIeEBt2
 eUlEGAburEPTG/l4gpX50yncmp2aJHT+VX/NELGkgiQ8QTazvx33i4+5B4KPfW20REqjeN35B7EbI
 dYLmHTEUWkdgkchF2kRkiTXwmFi4R9UDO86TkZEab7NkBVsdailIJdUfP6ODY8NAZpgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H9rmmj8x9/pRGSP0rhWzAN2XdXyBU8aire6+hcOWaqg=; b=hO53b/j71p0mAeVZFcagJ52UYj
 2ORgA12kKveEY2SPe5XLZTU0KWfCGllDLCwBmElHleb1Xpc4ochrB4snzBEq0Hw/tfK/66SdX0ElC
 9jC3Ti09/gyjuZN0dKQQYgZtw0SshSa2v6ss2M9zBzRu/32VH35wQF4FLSHqjXkdVqdU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okOpv-0000Ni-Mh; Mon, 17 Oct 2022 12:03:17 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22E24205DF;
 Mon, 17 Oct 2022 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666008185;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9rmmj8x9/pRGSP0rhWzAN2XdXyBU8aire6+hcOWaqg=;
 b=EinRM8cmED2AkAp5rHQ9Q/lhD8djKWOsD88oc+NtD13fI7XxVo1WUUyzmKt/GVSI6gbzAB
 avLzqrApgtjFLBBG/xJ+AFWnU8r7YZVrpEWdvAM7p60Y5lEedj8arNYOaEbKzaLwxt/Hc/
 U1NJTeEZ2sDSl3Q+1AEau/ybC7ZtAR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666008185;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H9rmmj8x9/pRGSP0rhWzAN2XdXyBU8aire6+hcOWaqg=;
 b=+HpnUQkgMm3dqcglnnoPcbVqtG7gqDj2H/lOtRIyBB+kZhaON0Kk1MTD50LMU/hFLdJhAr
 f8WVAuBtfTzw7QAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9608D13398;
 Mon, 17 Oct 2022 12:03:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ovthI3hETWM0JQAAMHmgww
 (envelope-from <dsterba@suse.cz>); Mon, 17 Oct 2022 12:03:04 +0000
Date: Mon, 17 Oct 2022 14:02:55 +0200
From: David Sterba <dsterba@suse.cz>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20221017120255.GM13389@twin.jikos.cz>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
 <20221014091503.GA13389@twin.jikos.cz>
 <CACT4Y+as3SA6C_QFLSeb5JYY30O1oGAh-FVMLCS2NrNahycSoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+as3SA6C_QFLSeb5JYY30O1oGAh-FVMLCS2NrNahycSoQ@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 17, 2022 at 10:31:03AM +0200,
 Dmitry Vyukov wrote:
 > On Fri, 14 Oct 2022 at 11:15, David Sterba <dsterba@suse.cz> wrote: > >
 On Fri, Oct 14, 2022 at 08:48:30AM +0000, Hrutvik Kanabar wrote [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
X-Headers-End: 1okOpv-0000Ni-Mh
Subject: Re: [f2fs-dev] [PATCH RFC 0/7] fs: Debug config option to disable
 filesystem checksum verification for fuzzing
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hrutvik Kanabar <hrutvik@google.com>, kasan-dev@googlegroups.com,
 Hrutvik Kanabar <hrkanabar@gmail.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Marco Elver <elver@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Anton Altaparmakov <anton@tuxera.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ntfs-dev@lists.sourceforge.net, dsterba@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Aleksandr Nogikh <nogikh@google.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 17, 2022 at 10:31:03AM +0200, Dmitry Vyukov wrote:
> On Fri, 14 Oct 2022 at 11:15, David Sterba <dsterba@suse.cz> wrote:
> > On Fri, Oct 14, 2022 at 08:48:30AM +0000, Hrutvik Kanabar wrote:
> > > From: Hrutvik Kanabar <hrutvik@google.com>
> > I think the build-time option inflexible, but I see the point when
> > you're testing several filesystems that it's one place to set up the
> > environment. Alternatively I suggest to add sysfs knob available in
> > debuging builds to enable/disable checksum verification per filesystem.
> 
> What usage scenarios do you have in mind for runtime changing of this option?
> I see this option intended only for very narrow use cases which
> require a specially built kernel in a number of other ways (lots of
> which are not tunable at runtime, e.g. debugging configs).

For my own development and testing usecase I'd like to build the kernel
from the same config all the time, then start a VM and run random tests
that do not skip the checksum verification. Then as the last also run
fuzzing with checksums skipped. The debugging (lockdep, various sanity
checks, ...) config options are enabled. We both have a narrow usecase,
what I'm suggesting is a common way to enable them.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
