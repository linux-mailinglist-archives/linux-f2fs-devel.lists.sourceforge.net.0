Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB9A843F7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 15:03:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2rYZ-00072d-R4;
	Thu, 10 Apr 2025 13:02:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1u2rYY-00072X-I2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 13:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q4ME9urMDx9w+JoQLEzbCeGIf9AXoC9G+YsUnHnd4pM=; b=SyJEG2J/dH2d5H3PkFeD47ebPV
 Ob+VUcrlNOu0aRRffDREMo9a6vdrRlMifJIpY2e/pf1Z+n+m5V4dTJc8vMjKTvygpRGm1oHKy/VFH
 g+roNrbMghpDCXaomZ9g0R6eHZwNmYy2XhQYk9eOBQ1lGCMcae+7qUJ0jOAyFh7yhxDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q4ME9urMDx9w+JoQLEzbCeGIf9AXoC9G+YsUnHnd4pM=; b=k
 smN/CELhOIJbjxD5kOp+B0apFDpbrxwwuzC3JQIuv9FZf82IXwv6b4o3tcK3NYaLjBtH12tTJlm+D
 vKktpqRsuhpnQt9+N0Ug2NrlYU/8D4xHmwibdUk2kInUV8EDHxahb4L4BvdJbB54nAzrsebl1gW83
 s0+8Ukqbdm+/QIS8=;
Received: from mail-oa1-f65.google.com ([209.85.160.65])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u2rYI-0003oO-Qb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 13:02:58 +0000
Received: by mail-oa1-f65.google.com with SMTP id
 586e51a60fabf-2b2b6019a74so347048fac.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Apr 2025 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744290152; x=1744894952; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q4ME9urMDx9w+JoQLEzbCeGIf9AXoC9G+YsUnHnd4pM=;
 b=DwhlxkVnxBy3fNGvCwDz/8gokTdMBiok69AShDeMkC0Pq0+c7OrMsLI4Wx1iTDeayu
 7Ym/jWintBumevFv59hEMlDS3g8p+V9GtgSnrezSzIzd4xlSXfHz7pnWrXe31vJTYqEB
 jDG/9LZwIeYcIHAc9jJsdV4QR7HZ8M743ikIPKWE2g3ceA7RHU3v+sDWldCL3g43meqv
 xZHG9CvpLtZRuRA+QjeUR2gQIjI8tAlXmbosUP08lCecs1rQneaa7NssQJyILomCRt4b
 eIHkkh0SY2WG01A6o4FP6Xxuqf3eSp0Ytgxh5qZ6O48+KNgHqV1O87JgOeojVkwydDDf
 fcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744290152; x=1744894952;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q4ME9urMDx9w+JoQLEzbCeGIf9AXoC9G+YsUnHnd4pM=;
 b=sW7fCNjoNWU/Dv3vmZm35A8wxmtSXoHVWde80j1ohihXY3oE4CT1wSLfe0mS2h0kDU
 yd4wohUx5NIwPu7zeJGtp8jnoey+yiKelEyT5qGIltNrsRKN0R5eaJn2uoGpA1LovnDt
 uI/l7/japzAQcxdlGEH8YjFIYI6sYKoTVOFPLeNqFSSTWxklCKr5Pb955igZqbAC5NzY
 3ZUyzuGs86J4H5BTpxkSyfnvAj7RccvhChgJkPnBfWbP9C5SOl+zqT2KRHuObPyJRBP3
 W16w1Yn04zwZC2y7h639TtuFXI6g1re8vua+yjdD+xtdIno5yKVz9bLeaaMSQ+p7Idho
 rhJw==
X-Gm-Message-State: AOJu0YxykaQ+r/cDRX6mffAySWfcxMVJsxr4s1OXDkrJ92z/bEJtQ1wN
 nG2Cq9oZWxgFPXgYQKM3UH1oLF8TJGnmm4Ny+kKdwkTkNQJt/uuTZRK0zidkgFVQm5bC7x5GiMN
 mKYr0H36wFwZeBFgEUc8xk7GZ2JnRReUI2PM6pyVi
X-Gm-Gg: ASbGnct82SfBIRD1B10W4E4CxZMUI9eSCwf74DX0RifUexTS8qDROAqzn3fd2WkI9mS
 hlYD8R6HVL9YLZABumKydJZRRCri8aIMhWkZ8628dhv1/2cgRwJFxzv63wjyMjQk1AwbA0eHdvc
 RrnJqFE7r0ntVugHdN0uJ49hs=
X-Google-Smtp-Source: AGHT+IHHcyM4JagDrfKqjXOkGzvmF1RNprivjAANSbGoRgiB6JEuGSqwHAUK2qAwMbRj12EYIDfIkKuSylMS/Pg0Jb0=
X-Received: by 2002:a05:6870:af91:b0:2c1:5fcd:acc5 with SMTP id
 586e51a60fabf-2d0b5b5ba95mr1261542fac.10.1744290151636; Thu, 10 Apr 2025
 06:02:31 -0700 (PDT)
MIME-Version: 1.0
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Thu, 10 Apr 2025 21:02:18 +0800
X-Gm-Features: ATxdqUFTTYY99-WppmK1jjEehjBQpwRy--aYlho_VQOALBAltg7NTn_hrRWfjtc
Message-ID: <CAMLCH1F+0be4Jffz6jy7da2THJcA=V6jDFAKWg8Z_e=Y9g0F4A@mail.gmail.com>
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear f2fs Development Community, This thread is initiated
 to discuss the challenge of integrating iomap_folio_state (hereafter referred
 to as ifs) into f2fs pointed out by Mr. Matthew in this email: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nzzhao.sigma[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.65 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.65 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.65 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u2rYI-0003oO-Qb
Subject: [f2fs-dev] [DISCUSSION] Preliminary design thoughts on f2fs own
 folio_state struct for folio->private
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "v-songbaohua@oppo.com" <v-songbaohua@oppo.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear f2fs Development Community,

This thread is initiated to discuss the challenge of integrating
iomap_folio_state (hereafter referred to as ifs) into f2fs pointed out
by Mr. Matthew in this email:
https://lore.kernel.org/linux-f2fs-devel/CAMLCH1EOSvA1As4vdBcpsh75apFmknOfHihORxVOmmZ-+muK5Q@mail.gmail.com/T/#t

> The challenge with that is that iomap does not support all the
> functionality that f2fs requires.  The iomap data structure could
> be duplicated inside f2fs, but then we hit the problem that f2fs
> currently stores other information in folio->private.  So we'd need
> to add a flags field to iomap_folio_state to store that information
> instead.


To address this, I have designed a custom structure for f2fs, aiming
to minimize modifications to existing iomap functionalities and data
structures. The proposed structure, named f2fs_iomap_folio_state
(hereafter referred to as f2fs_ifs), is defined as follows:

f2fs_iomap_folio_state
{
    struct iomap_folio_state ifs;
    unsigned int magic_number;
    unsigned int private; // for f2fs page private flags
}

The f2fs_ifs structure embeds the standard ifs structure at the
beginning of its definition. This ensures that the initial memory
layout of f2fs_ifs is identical to ifs, thereby maintaining
compatibility with a wide range of iomap APIs (excluding ifs_alloc and
ifs_free). Importantly, calling ifs_alloc on a folio whose
folio->private already points to an f2fs_ifs structure will not result
in errors. This is because ifs_alloc is designed to return the
existing pointer if folio->private is not NULL.

My original purpose behind this design is to preserve the integrity of
native iomap functions and data structures as much as possible. The
level of customization currently provided by iomap functions for file
systems appears to be insufficient for f2fs's requirements. For
example, the iomap_readahead function's iomap_readpage_iter internally
and inflexibly calls APIs like ifs_alloc.

Currently, there are two key technical details that require careful
consideration:

Distinguishing between ifs and f2fs_ifs: A significant challenge is
reliably differentiating whether a given folio->private pointer points
to a standard ifs or our custom f2fs_ifs structure. This is a headache
as it involves runtime type identification from a void*, which cannot
be resolved through compile-time type checking. To mitigate this, I
have introduced a magic_number field within f2fs_ifs. The proposed
approach is to cast folio->private to f2fs_ifs, calculate an offset
based on the size of the ifs structure (which is dynamically
determined by the folio's block count due to the variable-sized state
bitmap in ifs), and then check if the value at the magic_number field
matches a pre-defined magic value. If a match is found, we infer that
it is an f2fs_ifs.

However, this approach is not without risk. In the scenario where
folio->private points to a regular ifs, and by a little chance, the
value at the calculated offset within the ifs structure happens to
coincide with our chosen magic number, the check would incorrectly
identify it as f2fs_ifs. This could potentially lead to undefined
behavior. I am actively seeking more robust solutions for this type
identification problem and would greatly appreciate any suggestions or
alternative approaches the community might offer.

Allocation Timing of f2fs_ifs: Another crucial aspect is determining
the optimal timing for allocating f2fs_ifs. My current thinking is
that allocating it during the readahead process might be advantageous.
At this stage, the folio is under lock protection, ensuring thread
safety. Furthermore, allocating f2fs_ifs during readahead could
ideally ensure that the private field of all folios within the page
cache consistently points to f2fs_ifs.I belive this will bring a lot
of convenience.
The implementation may be a bit tricky. If we intend to leverage
iomap_readahead to provide an iomap-based readahead function for f2fs,
custom iomap_begin and iomap_end operations will not suffice for
allocating f2fs_ifs. This limitation arises because these functions do
not have access to the necessary readahead_control and
iomap_readpage_ctx structures, and consequently, cannot directly
access the folio.

My current proposed solution is as follows:

f2fs_iomap_readahead(readahead_control* rac)
{
    struct readahead_control rac_cp = copy_rac(rac);
    struct folio* folio;
    while (folio = readahead_folio(rac_cp)) {
        f2fs_ifs_alloc(folio);
    }
    iomap_readahead(rac, &f2fs_buffered_read_iomap_ops);
}

Alternatively, we could consider duplicating the iomap_readahead
function within f2fs and making the necessary modifications directly
within the duplicated code.

I would greatly appreciate any feedback, insights, and suggestions
from the community regarding these technical details and the overall
approach. Your expertise and perspectives are invaluable as we work
towards a robust and efficient integration of iomap_folio_state into
f2fs.

Thank you for your time and consideration.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
