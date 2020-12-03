Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0122CCD1B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 04:14:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkf51-0003hj-4y; Thu, 03 Dec 2020 03:14:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mirq-linux@rere.qmqm.pl>)
 id 1kkf4z-0003hZ-Ro; Thu, 03 Dec 2020 03:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7/n+cXqcfYHZjPfYt3Sl0Wq4HY2KAxNBEdItthGOJI=; b=LBbTuSke6e9r0h+Ixbdt/xSj1C
 AXdSHYVuRUpsF3BzBOM8qPDtkPVMohEx0tfQkbi+1ZHYXMtrZkzVD61zNyPfCw521R/RAulnjfyRt
 DmzeCjEiQW9/qmlcaNwhBWZCW/t2uJ/g7+8jwoYfwhWlfuQkwWhhyKsRkWm1a/0onn/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o7/n+cXqcfYHZjPfYt3Sl0Wq4HY2KAxNBEdItthGOJI=; b=QdAko9U3MMTZBEfmH1YeTxQFdx
 FJ99YmaTezwSuuKNUa0BgrebENNv8NLghg7sv0a4TgipspJ3+WGv0rpBmbZ7/nHrcg0sdB6vKbmZt
 bMH1h7Zfu2eQxAhU6nuFGtmsNaxlA6ZwSC041bsLoAu7fycsbqPXVzn8hrnu8Nygv1Vs=;
Received: from rere.qmqm.pl ([91.227.64.183])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkf4q-00CVyl-BH; Thu, 03 Dec 2020 03:14:49 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CmgtH6LsqzDf;
 Thu,  3 Dec 2020 04:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1606965273; bh=ZdAOG3NcuHGK7lFYYvnqJKsMgeqVqed0k+AuMpqBsVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GbJ6klnUee1HbJVtw4KbzKPz4NHSRXuqMt8jfsssGDrrXWb+AvlXHq3ixQPcK78Nk
 9fSBwuY0GonAcufYJEOaZksH29dY7d0okUcxXy9ZRT4Rb3BRcgkUdO2PblQoR9bnrz
 SSwooLfwoxjfsFCd/eN2JFpaAD48NXJk4NUDXxDYkJ9T01VyuVtPmbsVHlcLeKXorW
 ATi1zQlQaXpUBMVLahgIG6Es64dQNVKOxMDLa1c+vkauJAqEQLYECYl6xFD6YjzpzS
 yAxqcO2/Bzlh19IG28c8VBQLOgpolEx5P17ixPpGzJlyXhFNzZ6mGIPzqIvaxs80UO
 NKWwFyrmBzQIg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 3 Dec 2020 04:14:29 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Nick Terrell <terrelln@fb.com>
Message-ID: <20201203031429.GA13095@qmqm.qmqm.pl>
References: <20201202203242.1187898-1-nickrterrell@gmail.com>
 <20201202203242.1187898-2-nickrterrell@gmail.com>
 <20201203011606.GA20621@qmqm.qmqm.pl>
 <297D9C8B-5F4D-4E3B-A5FD-DA292D8BA12A@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <297D9C8B-5F4D-4E3B-A5FD-DA292D8BA12A@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kkf4q-00CVyl-BH
Subject: Re: [f2fs-dev] [PATCH v6 1/3] lib: zstd: Add kernel-specific API
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 03, 2020 at 01:42:03AM +0000, Nick Terrell wrote:
> =

> =

> > On Dec 2, 2020, at 5:16 PM, Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.p=
l> wrote:
> > =

> > On Wed, Dec 02, 2020 at 12:32:40PM -0800, Nick Terrell wrote:
> >> From: Nick Terrell <terrelln@fb.com>
> >> =

> >> This patch:
> >> - Moves `include/linux/zstd.h` -> `lib/zstd/zstd.h`
> >> - Adds a new API in `include/linux/zstd.h` that is functionally
> >>  equivalent to the in-use subset of the current API. Functions are
> >>  renamed to avoid symbol collisions with zstd, to make it clear it is
> >>  not the upstream zstd API, and to follow the kernel style guide.
> >> - Updates all callers to use the new API.
> >> =

> >> There are no functional changes in this patch. Since there are no
> >> functional change, I felt it was okay to update all the callers in a
> >> single patch, since once the API is approved, the callers are
> >> mechanically changed.
> > [...]
> >> --- a/lib/decompress_unzstd.c
> >> +++ b/lib/decompress_unzstd.c
> > [...]
> >> static int INIT handle_zstd_error(size_t ret, void (*error)(char *x))
> >> {
> >> -	const int err =3D ZSTD_getErrorCode(ret);
> >> -
> >> -	if (!ZSTD_isError(ret))
> >> +	if (!zstd_is_error(ret))
> >> 		return 0;
> >> =

> >> -	switch (err) {
> >> -	case ZSTD_error_memory_allocation:
> >> -		error("ZSTD decompressor ran out of memory");
> >> -		break;
> >> -	case ZSTD_error_prefix_unknown:
> >> -		error("Input is not in the ZSTD format (wrong magic bytes)");
> >> -		break;
> >> -	case ZSTD_error_dstSize_tooSmall:
> >> -	case ZSTD_error_corruption_detected:
> >> -	case ZSTD_error_checksum_wrong:
> >> -		error("ZSTD-compressed data is corrupt");
> >> -		break;
> >> -	default:
> >> -		error("ZSTD-compressed data is probably corrupt");
> >> -		break;
> >> -	}
> >> +	error("ZSTD decompression failed");
> >> 	return -1;
> >> }
> > =

> > This looses diagnostics specificity - is this intended? At least the
> > out-of-memory condition seems useful to distinguish.
> =

> Good point. The zstd API no longer exposes the error code enum,
> but it does expose zstd_get_error_name() which can be used here.
> I was thinking that the string needed to be static for some reason, but
> that is not the case. I will make that change.
> =

> >> +size_t zstd_compress_stream(zstd_cstream *cstream,
> >> +	struct zstd_out_buffer *output, struct zstd_in_buffer *input)
> >> +{
> >> +	ZSTD_outBuffer o;
> >> +	ZSTD_inBuffer i;
> >> +	size_t ret;
> >> +
> >> +	memcpy(&o, output, sizeof(o));
> >> +	memcpy(&i, input, sizeof(i));
> >> +	ret =3D ZSTD_compressStream(cstream, &o, &i);
> >> +	memcpy(output, &o, sizeof(o));
> >> +	memcpy(input, &i, sizeof(i));
> >> +	return ret;
> >> +}
> > =

> > Is all this copying necessary? How is it different from type-punning by
> > direct pointer cast?
> =

> If breaking strict aliasing and type-punning by pointer casing is okay, t=
hen
> we can do that here. These memcpys will be negligible for performance, but
> type-punning would be more succinct if allowed.

Ah, this might break LTO builds due to strict aliasing violation.
So I would suggest to just #define the ZSTD names to kernel ones
for the library code.  Unless there is a cleaner solution...

Best Regards
Micha=B3=A0Miros=B3aw


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
