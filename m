Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7047F23C0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Nov 2023 03:17:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5GKM-0005lk-02;
	Tue, 21 Nov 2023 02:17:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1r5GKH-0005lR-7k
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 02:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RI/R/dL+OK3InX9FiqKDXHPEN021Sx3jNB6FQIcl/vA=; b=DX1Dr+zHBZaNUti8n92FfmmFXn
 QhmSkH19AA8q/mt661X3W3VfvMfcEsVb1dhMt/oJSSb71IgfdpQqWKk706ceZ/GYzWa97Ag8UYbNx
 9KwPUDRt6vi258r6YntJ3duxlAzsXFkSP6HvMTSreMTsJ9ylbB815GK1asXCFZBgBHgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RI/R/dL+OK3InX9FiqKDXHPEN021Sx3jNB6FQIcl/vA=; b=hvS/o84Y0japeVqV3YCVx1rP06
 NoRaECGBIcFF47rS+RHIx9Gd15Wi+EkaJuILAXDXmeZd78Qo+gd2ZLaJuWUbVPJd826nKJIr0ggel
 QC21mCroBrlI+DE4VYxiNypTQ5QeoKQsTYGJSJgPnZUJ/AiUu4kTKU1PsOSVgJpAWxiM=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5GKD-0004JQ-Bm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 02:17:19 +0000
Received: from cwcc.thunk.org (pool-173-48-82-21.bstnma.fios.verizon.net
 [173.48.82.21]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 3AL22s5b004315
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Nov 2023 21:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1700532178; bh=RI/R/dL+OK3InX9FiqKDXHPEN021Sx3jNB6FQIcl/vA=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=fh+Iz59mAaEhYI6Rnl1Ws5eNRCdm8wGGiPBNrtSex6iEN3evmaEE4VQ38o7HziJIX
 1oE53Yx5gx4QD+4kGuf0DRlqTlOmzTWeEI2U3lwozuid2nmQUf3gYQ2cFfVX58ObIS
 AOF5SVofHZTGGj/d41vBKcNaXkE103Uvrh87PK5pi0LdMGHs5Xqj6zMO4rTyX9usd9
 drGCCLumglHiyBKsUPqRzlaLSTktuNh3kOnfULa7loj6SCmki5AcJ9s3b1I/ItdyGj
 OJ8dmIFQVzZuLCX6BAwNAawsKR4kbHK+H0hmI1SBGThTTmsfe2NgCjRISca5zfG2+N
 +bR7dioZFi29A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id A86F715C02B0; Mon, 20 Nov 2023 21:02:54 -0500 (EST)
Date: Mon, 20 Nov 2023 21:02:54 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231121020254.GB291888@mit.edu>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 20, 2023 at 10:07:51AM -0800,
 Linus Torvalds wrote:
 > Of course, "do it in shared generic code" doesn't tend to really fix >
 the braindamage, but at least it's now shared braindamage and n [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5GKD-0004JQ-Bm
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 20, 2023 at 10:07:51AM -0800, Linus Torvalds wrote:
> Of course, "do it in shared generic code" doesn't tend to really fix
> the braindamage, but at least it's now shared braindamage and not
> spread out all over. I'm looking at things like
> generic_ci_d_compare(), and it hurts to see the mindless "let's do
> lookups and compares one utf8 character at a time". What a disgrace.
> Somebody either *really* didn't care, or was a Unicode person who
> didn't understand the point of UTF-8.

This isn't because of case-folding brain damage, but rather Unicode
brain damage.  We compare one character at a time because it's
possible for some character like =E9 to either be encoded as 0x0089 (aka
"Latin Small Letter E with Acute") OR as 0x0065 0x0301 ("Latin Small
Letter E" plus "Combining Acute Accent").

Typically, we pretend that UTF-8 means that we can just encode =E9, or
0x0089 as 0xC3 0xA9 and then call it a day and just use strcmp(3) on
the sucker.  But Unicode is a lot more insane than that.  Technically,
0x65 0xCC 0x81 is the same character as 0xC3 0xA9.

> Oh well. I guess people went "this is going to suck anyway, so let's
> make sure it *really* sucks".

It's more like, "this is going to suck, but if it's going to suck
anyway, let's implement the full Unicode spec in all its gory^H^H^H^H
glory, whether or not it's sane".


					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
