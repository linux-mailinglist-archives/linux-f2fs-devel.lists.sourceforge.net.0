Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD592CCBC5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 02:40:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkdbZ-0007fp-6g; Thu, 03 Dec 2020 01:40:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mirq-linux@rere.qmqm.pl>)
 id 1kkdbX-0007ff-1Y; Thu, 03 Dec 2020 01:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cuOn5bVJZy5iKEwlXrn7Tf414lHOqQ82Eu9bbUWOvp0=; b=DyWJYFhsiXwK4joWRO+6LZ7bfG
 u/z+JxziVzSvFV88Ul/Cz6f4A4vWE1KiERlp3cs0qzMUHWewSGiOifxkEu3pPifKlkCRYhY4f6sIo
 ORCQJO9JUnCEY5BGRVnfH/g9AJII8mtgsAjxdLfySgAlPfuJmwVrszpZdX2MvMs5O8Mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cuOn5bVJZy5iKEwlXrn7Tf414lHOqQ82Eu9bbUWOvp0=; b=X0O8o8I9ym+4dvnfQtyMQSoNOe
 wFiEgoGY9M4lfp1hMYQlNhB9rFNE31j804aIf2kuWFGBPz5TpRO+LVuzErP63hZovdTm5vtZuRWDY
 w8YzareT4tvul8+GgB7B5om/gknLgjMfWrTg6rbMoUF0cWiw0kXMlJvPjHTPyCUFPgWo=;
Received: from rere.qmqm.pl ([91.227.64.183])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkdbO-00COlU-Jl; Thu, 03 Dec 2020 01:40:18 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CmdFh0f48zDf;
 Thu,  3 Dec 2020 02:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1606958169; bh=6oH15t1Df77ZzG2EVYajQgZvMvBqFmQvQbWlZwQ2QEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SB1xzSoxRoViOvvVeCEfofLQUmg5XpUMvkEJnMhZgf4r5+49NISCcc68BpcHlcelp
 vNYiHf3Y6pH9y2kgG7CWVFcbafVXxYka/WdyrF0KPL5Hvh5EhPE4vDVnBYWQ3gRoX8
 ztYX1Suc2WQy4SYjMo6rZCiD2t1qqX3t4HkyXGYXL9AipWeYZm9B4FPZDuskD4j7MS
 ayG7+2YnPhqL8qlmrUe2wpRqI5pMaDMoU5rWiO90pfbg+wyvzGLDAFf7lfU7Rn2Ml5
 BU67UaFjNVJGrLp02M/bcgw7yq7F2AcsD/5mZfdpWtcSPr9z531bqis+g9Of2npGuf
 2JgTSxT7Emreg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 3 Dec 2020 02:16:06 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Nick Terrell <nickrterrell@gmail.com>
Message-ID: <20201203011606.GA20621@qmqm.qmqm.pl>
References: <20201202203242.1187898-1-nickrterrell@gmail.com>
 <20201202203242.1187898-2-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201202203242.1187898-2-nickrterrell@gmail.com>
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
X-Headers-End: 1kkdbO-00COlU-Jl
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Christoph Hellwig <hch@infradead.org>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 02, 2020 at 12:32:40PM -0800, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> =

> This patch:
> - Moves `include/linux/zstd.h` -> `lib/zstd/zstd.h`
> - Adds a new API in `include/linux/zstd.h` that is functionally
>   equivalent to the in-use subset of the current API. Functions are
>   renamed to avoid symbol collisions with zstd, to make it clear it is
>   not the upstream zstd API, and to follow the kernel style guide.
> - Updates all callers to use the new API.
> =

> There are no functional changes in this patch. Since there are no
> functional change, I felt it was okay to update all the callers in a
> single patch, since once the API is approved, the callers are
> mechanically changed.
[...]
> --- a/lib/decompress_unzstd.c
> +++ b/lib/decompress_unzstd.c
[...]
>  static int INIT handle_zstd_error(size_t ret, void (*error)(char *x))
>  {
> -	const int err =3D ZSTD_getErrorCode(ret);
> -
> -	if (!ZSTD_isError(ret))
> +	if (!zstd_is_error(ret))
>  		return 0;
>  =

> -	switch (err) {
> -	case ZSTD_error_memory_allocation:
> -		error("ZSTD decompressor ran out of memory");
> -		break;
> -	case ZSTD_error_prefix_unknown:
> -		error("Input is not in the ZSTD format (wrong magic bytes)");
> -		break;
> -	case ZSTD_error_dstSize_tooSmall:
> -	case ZSTD_error_corruption_detected:
> -	case ZSTD_error_checksum_wrong:
> -		error("ZSTD-compressed data is corrupt");
> -		break;
> -	default:
> -		error("ZSTD-compressed data is probably corrupt");
> -		break;
> -	}
> +	error("ZSTD decompression failed");
>  	return -1;
>  }

This looses diagnostics specificity - is this intended? At least the
out-of-memory condition seems useful to distinguish.

> +size_t zstd_compress_stream(zstd_cstream *cstream,
> +	struct zstd_out_buffer *output, struct zstd_in_buffer *input)
> +{
> +	ZSTD_outBuffer o;
> +	ZSTD_inBuffer i;
> +	size_t ret;
> +
> +	memcpy(&o, output, sizeof(o));
> +	memcpy(&i, input, sizeof(i));
> +	ret =3D ZSTD_compressStream(cstream, &o, &i);
> +	memcpy(output, &o, sizeof(o));
> +	memcpy(input, &i, sizeof(i));
> +	return ret;
> +}

Is all this copying necessary? How is it different from type-punning by
direct pointer cast?

Best Regards
Micha=B3 Miros=B3aw


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
