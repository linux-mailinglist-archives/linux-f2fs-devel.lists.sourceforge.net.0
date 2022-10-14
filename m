Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB505FEB67
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 11:15:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGms-0007gt-2g;
	Fri, 14 Oct 2022 09:15:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1ojGmq-0007gk-Tn;
 Fri, 14 Oct 2022 09:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lop39TQqCOXXxSbDsyQkXoUBrxToIIED3a6P4bzyLLs=; b=U2UrRdPHE3wfADa6U6uROKnPhq
 crYQqten3fcW6UW5MCUBgGF5Omtjkmy2vRjWU8GqruHLXVD7Y5Zd8PjA+ZBDRvZJQ2NxKM+mkp7sA
 tVJqvqOqt7OvEje91WMIYc58myVCWW1knoC4naiv7kKJtoNDsWanP2X/nkK0jTYoMjzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lop39TQqCOXXxSbDsyQkXoUBrxToIIED3a6P4bzyLLs=; b=NErhSJ480kuRmsLiQlMZ3Wx/RD
 LhnxL3+bD9y6yln78SRgInem1f56WchWKZsVlhY37GL/XPmwKllTt+oh2j+E+SMZloC78lwWrFWJ/
 XszWeypOwOrMra26GKndo3hk/+HeKOdDlLP27XOjaXJgPrUujINClWuM5Eg6XkzD6i/8=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGmm-0003h1-0K; Fri, 14 Oct 2022 09:15:24 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A54BF1F383;
 Fri, 14 Oct 2022 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665738910;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lop39TQqCOXXxSbDsyQkXoUBrxToIIED3a6P4bzyLLs=;
 b=tbFHpqFR6QaOIdTM3EjXqJMH4F2nsfNF1+12MoNCtlTg0QR24CzfGM9L1WDe2QqP2G90WB
 YnyKxp5hvRXQQ4ZVZadq6bTq34yF3s1dHMZ9iK6Tl7j+V9tT5staNs0dZumE4Z9muul4J2
 lypDUS8DsrYcUooJLONUXjF07PQAiss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665738910;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lop39TQqCOXXxSbDsyQkXoUBrxToIIED3a6P4bzyLLs=;
 b=STUhXyiyCDJNq1qGz+0oeqFPiI1DomfdYg0GmUVMYp0/weXSBRVg5jxfDErRWMhIXyWBVy
 YcFijTKScbu3V9Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F10613451;
 Fri, 14 Oct 2022 09:15:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EbSrCp4oSWM1GQAAMHmgww
 (envelope-from <dsterba@suse.cz>); Fri, 14 Oct 2022 09:15:10 +0000
Date: Fri, 14 Oct 2022 11:15:03 +0200
From: David Sterba <dsterba@suse.cz>
To: Hrutvik Kanabar <hrkanabar@gmail.com>
Message-ID: <20221014091503.GA13389@twin.jikos.cz>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221014084837.1787196-1-hrkanabar@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 14, 2022 at 08:48:30AM +0000, Hrutvik Kanabar
 wrote: > From: Hrutvik Kanabar <hrutvik@google.com> > > Fuzzing is a proven
 technique to discover exploitable bugs in the Linux > kernel. But [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ojGmm-0003h1-0K
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Hrutvik Kanabar <hrutvik@google.com>, kasan-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Anton Altaparmakov <anton@tuxera.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 14, 2022 at 08:48:30AM +0000, Hrutvik Kanabar wrote:
> From: Hrutvik Kanabar <hrutvik@google.com>
> 
> Fuzzing is a proven technique to discover exploitable bugs in the Linux
> kernel. But fuzzing filesystems is tricky: highly structured disk images
> use redundant checksums to verify data integrity. Therefore,
> randomly-mutated images are quickly rejected as corrupt, testing only
> error-handling code effectively.
> 
> The Janus [1] and Hydra [2] projects probe filesystem code deeply by
> correcting checksums after mutation. But their ad-hoc
> checksum-correcting code supports only a few filesystems, and it is
> difficult to support new ones - requiring significant duplication of
> filesystem logic which must also be kept in sync with upstream changes.
> Corrected checksums cannot be guaranteed to be valid, and reusing this
> code across different fuzzing frameworks is non-trivial.
> 
> Instead, this RFC suggests a config option:
> `DISABLE_FS_CSUM_VERIFICATION`. When it is enabled, all filesystems
> should bypass redundant checksum verification, proceeding as if
> checksums are valid. Setting of checksums should be unaffected. Mutated
> images will no longer be rejected due to invalid checksums, allowing
> testing of deeper code paths. Though some filesystems implement their
> own flags to disable some checksums, this option should instead disable
> all checksums for all filesystems uniformly. Critically, any bugs found
> remain reproducible on production systems: redundant checksums in
> mutated images can be fixed up to satisfy verification.
> 
> The patches below suggest a potential implementation for a few
> filesystems, though we may have missed some checksums. The option
> requires `DEBUG_KERNEL` and is not intended for production systems.
> 
> The first user of the option would be syzbot. We ran preliminary local
> syzkaller tests to compare behaviour with and without these patches.
> With the patches, we found a 19% increase in coverage, as well as many
> new crash types and increases in the total number of crashes:

I think the build-time option inflexible, but I see the point when
you're testing several filesystems that it's one place to set up the
environment. Alternatively I suggest to add sysfs knob available in
debuging builds to enable/disable checksum verification per filesystem.

As this may not fit to other filesystems I don't suggest to do that for
all but I am willing to do that for btrfs, with eventual extension to
the config option you propose. The increased fuzzing coverage would be
good to have.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
