Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPrrFxWXB2r/9wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 23:58:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0246558807
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 23:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOB+eR/0ZsdYy2Kyw3R3iGwjMjHSwHcpq0qCG5lRPig=; b=k5Ga5L+p4Nrcnhu+XSBC+33Cjk
	xaBOX8tHG0KVDStK5fJo9dmplbUgVJdhub1mhPZoUsL9hy5eodGGAtLPFpXXeJEeiCOBPRQVQ5zbd
	qd4NgNcEaWrUZJ4GxBZbqwApL4o8rvOOmCOmpVbJQp5pJ28Snn54KaPSwq5pp6z0ev+o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0YF-0008RI-2p;
	Fri, 15 May 2026 21:58:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0YB-0008RB-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 21:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/mHSzbEHbunn4Gv+x6uYZkpcvkpdkTON/QAE5a6at5M=; b=clOPuXXvfh7l3yUR0yjmY3U8vV
 zQo+imRiaQQb9B7cK9Q4NKwVh/mU0E8gFRmseW/3JAJuLyIM9716/j5mofE4kCpjUEcf/2zwnh9ty
 +zqXuE7JbHFEnCQRluyHRiO/abQWupS9XicmSsMvGLEZ26gxjuREyxagjH/65Ma/QQxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/mHSzbEHbunn4Gv+x6uYZkpcvkpdkTON/QAE5a6at5M=; b=N+5hrZlnBc+7y1uWqvT5lmU5EW
 t0CrHgmXkUMwtofhwlgd4PgPHKuaP2CMS0Z6DntzGdgzW2CiE6k+WDtP9W9giAXnnUVbHMeT00EVY
 dyPiRgh4cOJ3HE0KqMsPHE0ZtHeooywI7NEIkrMmBhuRho9DH9yXVP2IWUyPCaKxuMNI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0Y8-00026c-Gx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 21:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5EA8445DA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 21:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FFFC2BCC9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 21:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778882298;
 bh=/mHSzbEHbunn4Gv+x6uYZkpcvkpdkTON/QAE5a6at5M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YrySnH00B0W1qq5Wp87dlgYi2suFfNd57N2Uuth/vkCX1DrZ3IvFyxISLW0xoIF69
 hRjENHlGB/3ONaZlglJOc4ukuB0ctST7O4dj+rUVrdlnm1YanBPd1V+Bn1UhoHLW4E
 JXQ/kS1/ER7ObuNKR8I2hcUCtTBptWdMJXaZCExsraRoFD2Gyjk7NySzzJmUpzQ5cR
 j5a0wZY7iA7GqaZgUjtc+Taku3bBD9oUOyoWapVjk+PBcCyiTk7K5qE2vYSk/R3eiH
 nSUWFrQFAEnpEsEBNYMpxB2+u1QHKALgTRITtHr4Lpl3a/9KiTwUTCsF3mm9EJCbKa
 NZO40x8BvCEDg==
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-65c364b893aso670524d50.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 14:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+CUVGTIBGsm9R67Og2udJhkw/Hnr8UxrUIKOhGQQNhkBtyOTWlO96QTMNFXGUAOfEZOlMm0gCmUhEi/ruxaS1F@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzLYVD9ymGQZAMsowQqGBbb2HAFGOhLE0+cJpg3/RgEtMzH+CiC
 Z1/rie1bOoXg0w5sFZFrp7pJ76aYSRRc6n/4WslWnucnc8U/ircc8ZMd+lLc6Uxp0XxT97kdxrG
 g48aXGQzDswtTb6duJsTN++c+0H3LSNkai2u45OT7Wg==
X-Received: by 2002:a05:690e:1517:b0:65d:f308:b503 with SMTP id
 956f58d0204a3-65e22650c4amr5634144d50.1.1778882297534; Fri, 15 May 2026
 14:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-13-hch@lst.de>
In-Reply-To: <20260512053625.2950900-13-hch@lst.de>
Date: Fri, 15 May 2026 14:58:06 -0700
X-Gmail-Original-Message-ID: <CACePvbXhMm0nzXdTqbF5j57AC_7qOH-hMZ5pB6z0cZFfAixH5Q@mail.gmail.com>
X-Gm-Features: AVHnY4L_tQU_kPqgc-BeGp-d2068VNSoZvM02GkthxouKCr7BEGYMQdDLNaKcrQ
Message-ID: <CACePvbXhMm0nzXdTqbF5j57AC_7qOH-hMZ5pB6z0cZFfAixH5Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 11,
 2026 at 10:38 PM Christoph Hellwig <hch@lst.de>
 wrote: > > swap_info_struct is now internal to the MM subsystem, so remove
 it from > the public header. > > Signed-off-by: Christoph Hel [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wO0Y8-00026c-Gx
Subject: Re: [f2fs-dev] [PATCH 12/12] swap: move swap_info_struct to
 mm/swap.h
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
From: Chris Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chris Li <chrisl@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Kairui Song <kasong@tencent.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A0246558807
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chrisl@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,mail.gmail.com:mid,lst.de:email]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzjigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBzd2FwX2luZm9fc3RydWN0IGlzIG5vdyBpbnRlcm5hbCB0byB0
aGUgTU0gc3Vic3lzdGVtLCBzbyByZW1vdmUgaXQgZnJvbQo+IHRoZSBwdWJsaWMgaGVhZGVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpBY2tlZC1i
eTogQ2hyaXMgTGkgPGNocmlzbEBrZXJuZWwub3JnPgoKQ2hyaXMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
