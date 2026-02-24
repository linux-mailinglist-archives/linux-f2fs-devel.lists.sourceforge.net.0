Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEtSDaq3nWmQRQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 15:37:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4918872C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 15:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:In-Reply-To:Message-Id:To:From:Date:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4s0/znIIPsA+Imzuct6iOnwCjCQZbPUFM47A/8cPaY0=; b=h/o71H0BvZvx5/KhbfbeF+N2nT
	8/IV2AYPz2DHazWkVoNvOCvDyHrAW4+xM9X8nwXVlRQ6IPLHZ1CLhXFU24vAvNvRSVUx/q5EvmneN
	Ic16StQpAQ75ICrduZMMClNwRD1HVshf7WehK/kV0dx42NJzIyK8bROFybOjY671YfLQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vutXI-0008TA-FH;
	Tue, 24 Feb 2026 14:37:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@arndb.de>) id 1vutXG-0008T0-8I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 14:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e7mI4HpymDX2XCi9sMPC+TZYyqhUHKoWZGamGdWnans=; b=Jrb7fzzhn6JGAKbwOJx3xpL2Aq
 MxzfN6lYmanQHqVChJIFzbNMaY6kD31S4yY8OKjCMbuGsgBANVXwcauU9QUe6sJtLCGdXcubJIoFH
 3PQYtCKK3i0kKWinOpg4u43nosV4XmZrnDqN4cJ/uVVtWfW43CTeCiVyVWrwautLuoHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e7mI4HpymDX2XCi9sMPC+TZYyqhUHKoWZGamGdWnans=; b=TvlVhCZJobjltcd+pvR0c9Lojw
 G5ObnZcd2Ir03ZBkdKfnO3mcJyktQuy0p+VLE+BTaa585to4M2xADW7gyyKBQtewo0hgKCshi2qGP
 Rmwjib6DRfyYyJp6//K1GOwg+b4fHJy99mdneojovkX2GzZleRJ/C63gzovBFnPhGFQg=;
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vutXE-0001TO-OE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 14:37:14 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 25C857A0226;
 Tue, 24 Feb 2026 09:21:49 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-04.internal (MEProxy); Tue, 24 Feb 2026 09:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1771942908;
 x=1772029308; bh=e7mI4HpymDX2XCi9sMPC+TZYyqhUHKoWZGamGdWnans=; b=
 Dw6i0uu/cjeEym7qYZbcV8bbha2FtlwyYgq98MmQZqr9KnjS7uBJ4hF+w6kyjMN+
 bIN0I3pvhaTGXGpghd+AU6p1IzWQmMUNvi8eO+KMu0/fKJNMsxegOGEJCQ6JKneu
 qe3bcHcIv7bKTWquIdIRbkdwoR+yTBzVW1EAPemTTlsZUZp3+w3Ano3SvDT01HwP
 V2dHh8ZJfhfdjqS6vORYmFDEj8laqorkj3VTnI80bAOBnAOpG9TRNLKtvvfU5xGR
 GzIGCzPzCn0bTWbqKTWoR8sGZUkYXgR6TPLK1Gjbf0DnJS4Fk+oqbUMo7LqzGMSO
 Ih26J+iGO+eOzBON2feLDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771942908; x=
 1772029308; bh=e7mI4HpymDX2XCi9sMPC+TZYyqhUHKoWZGamGdWnans=; b=D
 4HqaUh8ITDXZbf8GK/kuAZjp9g2RXYdcMFppjI76TauqgBYNL3QajIOvip1Ta2T4
 BUK1vx3YdzsOYxTzlvB+vJlwOTx3QiIhTLaB6TRaGQHZ7OisD/d8cOgy+d12mdNz
 8b3xly9bkniq4Wm8un21kIRQw7y79aXUJKjkStnvFxTrfZsHRvzEzCJY4dyULPgS
 r6Xn3Yn2TWglH8F7zZmfjdnEW8l2o5vcnIbzSfWyrIixTOrk7pNw+YHzLBkSetVs
 es8nkshXWMIpsNJsH/dbRFovvp4lwVIAbWCkr0YNU7QWiMsNI2ZMl+Oq7S//hPga
 xzw6B12IRUF89fO5d0h/g==
X-ME-Sender: <xms:_LOdaSWdBJ6d23xA0gDoZ7AJ1ksEorJId6drmWVQ-JIWEnnJFb_a8w>
 <xme:_LOdaZb60DzGpTE1wrdOAJ5HezkD5jJEgEqKl1_TSU_SCzvq8gFJLLzw1PkAwoams
 dfd83hhAI8pGRUoeMlePlJOd6zYlddVMP68cy-JHA-X9sCWC88xwXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedtfeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
 phhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegvsghighhgvghrsh
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhsvhgvrhhithihsehlihhsthhsrdhl
 ihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqfhdvfhhsqdguvghvvghlsehlih
 hsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtohephhgthheslhhsthdr
 uggvpdhrtghpthhtohepughsthgvrhgsrgesshhushgvrdgtiidprhgtphhtthhopehlih
 hnuhigqdgsthhrfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
 nhhugidqvgigthegsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
 ihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_LOdaa7nX9WLv9NNYiBHorlVQMKcXox6-7zviO9ey-NUi0MDxSOmgg>
 <xmx:_LOdacEJ1j4w7csTmSvFz7YWPT_a5R9BfV4xOvGcjR8A5jm0YCOCdQ>
 <xmx:_LOdaVBPTPMXIHVJD2d5a-PEzLE7qts4oy3tQduIfiShOP8Wjo_0mw>
 <xmx:_LOdaRwr-AYw4bHcPBNKh-ClEujeHtarlQpPAgkzGWJ24ya_brYw0g>
 <xmx:_LOdaZG7S_rCFNDrmhQ92Qg41ztV-CaW2xJNisZLfsqAmdktFGh1mpsF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 180EC70006A; Tue, 24 Feb 2026 09:21:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AcHQldxZr-js
Date: Tue, 24 Feb 2026 15:19:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Sterba" <dsterba@suse.cz>, "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <d02f6b7c-76d5-4239-8a32-8163797a81b0@app.fastmail.com>
In-Reply-To: <20260224135507.GT26902@twin.jikos.cz>
References: <20260221204525.30426-1-ebiggers@kernel.org>
 <20260224135507.GT26902@twin.jikos.cz>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 24, 2026, at 14:55, David Sterba wrote: > On Sat,
 Feb 21, 2026 at 12:45:25PM -0800, Eric Biggers wrote: >> Currently,
 all filesystems
 that support fsverity (ext4, f2fs, and btrfs) >> cache [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vutXE-0001TO-OE
Subject: Re: [f2fs-dev] [PATCH] fsverity: add dependency on 64K or smaller
 pages
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
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.00 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[arndb.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dsterba@suse.cz,m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,arndb.de:s=fm3,messagingengine.com:s=fm3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,arndb.de:-,messagingengine.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,app.fastmail.com:mid]
X-Rspamd-Queue-Id: 5DE4918872C
X-Rspamd-Action: no action

On Tue, Feb 24, 2026, at 14:55, David Sterba wrote:
> On Sat, Feb 21, 2026 at 12:45:25PM -0800, Eric Biggers wrote:
>> Currently, all filesystems that support fsverity (ext4, f2fs, and btrfs)
>> cache the Merkle tree in the pagecache at a 64K aligned offset after the
>> end of the file data.  This offset needs to be a multiple of the page
>> size, which is guaranteed only when the page size is 64K or smaller.
>> 
>> 64K was chosen to be the "largest reasonable page size".  But it isn't
>> the largest *possible* page size: the hexagon and powerpc ports of Linux
>> support 256K pages, though that configuration is rarely used.
>> 
>> For now, just disable support for FS_VERITY in these odd configurations
>> to ensure it isn't used in cases where it would have incorrect behavior.
>> 
>> Fixes: 671e67b47e9f ("fs-verity: add Kconfig and the helper functions for hashing")
>> Reported-by: Christoph Hellwig <hch@lst.de>
>> Closes: https://lore.kernel.org/r/20260119063349.GA643@lst.de
>> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
>
> Makes sense to me, we have "depends on PAGE_SIZE_LESS_THAN_256KB" since
> somebody tried to use btrfs on the 256K system.

I wonder if we should just drop the configuration entirely. There
are very few users on either PowerPC44x (officially orphaned, but
I know users) and Hexagon (officially supported, but no hardware
available outside of Qualcomm). My impression is that this was
implemented purely because the hardware can do it, not because
anyone actually wants to use 256K pages.

I see that commit "e12401222f74 powerpc/44x: Support for 256KB
PAGE_SIZE" mentions how one has to patch the linker to support
larger than 64K pages, and I see that both powerpc and hexagon
linkers still hardcode the section alignment to 64K pages, for
obvious reasons.

      Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
