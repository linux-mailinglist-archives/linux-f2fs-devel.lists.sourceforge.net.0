Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2412DD47C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ckac6PZ9KJah9SnYggn3p/z7scEmkJ30KEczJrlKyZk=; b=EmpKoY8YIVqO8xrYRGmiDZsFQ
	kEc+2YBS3ELSnP2K92NAmR5CKx7mfI9UcHTjxb18j5Mvnzy1VdbCynT3VM8Xn43uvucmxCFgO+x71
	LSRrGtKjkQU7FaVaPPWoUKoSFeZWuSElKnXcWpZB17IsN2Ra1k/o/l1vg2uJe8aTUCBjA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpvSF-0007Lj-5V; Thu, 17 Dec 2020 15:44:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kpvSD-0007La-Uj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YJBDB26f+rldjj+37sZsFkhqfX20jU8Ct5zIftBgtXU=; b=JxM8bv/7UgLuFV0r72aZEnR1X2
 MWUvKlVJOuLLnWG6tbifMqdUj/neUkiAIBxuckLpxYX4nyx6sIry1VXLN+4MXen7rqd7q5s4SlUtl
 nzk9EyZfnnG0dU6PiZTe1t5pzdg12SCCU2CPgWEw0I2jLSvTEGlCvCf1nUrWiMxosSWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YJBDB26f+rldjj+37sZsFkhqfX20jU8Ct5zIftBgtXU=; b=Ba1tHWh/QPE+PUsXFNBNcbtP3Q
 GVRNjuamTHF1DIam/g5HWC6iq1N9jYQXLB+ulrDdqC/hr52r7c51oodSyoMaDAHKSasY/IjPSToM8
 P/Lh0R85RuHpkNaOyYIRF29oDO/H+kPueYKubqbZhdDgb7KL4FUPBloxEv//F0ym3Njo=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpvS9-000HIZ-7g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:44:33 +0000
Received: by mail-pf1-f181.google.com with SMTP id s21so19246628pfu.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YJBDB26f+rldjj+37sZsFkhqfX20jU8Ct5zIftBgtXU=;
 b=hhgQdzkn4X5+KE3TaD5QBQ1MyViUTs8nYplu8dVBPHSodPeadQRmtzi7/kzdtKtYaZ
 0wAJ8pgg49ZD77BJ9l1Ox3cSZORcPe3dtTBc93E4UcaIAgKtrhE4XyVs2TwCPazOThkf
 pxGK5Wn5t3y+kAtOKYcZWGDnQm6S+0Yepfe4ywYHDSy1bblhT/hVyLsE9LnijR/u1u7f
 /NzKEH1QZG+qwFp6mQe8zWs2chV4KT/8G2+EDYX8bVMGfYFH2hbnuxAjp97t2yJrcAeP
 WYm7+5/1TLeOkchXIT133Kpsn1Ocn5IZvbwfBX9cvdHEucf3aIzxT3xRH2LpBX1JzDn+
 /INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YJBDB26f+rldjj+37sZsFkhqfX20jU8Ct5zIftBgtXU=;
 b=FvG7m3VyvBI1bDQgCGuIVgNwpAOQ1MYFTORLZanmtX4ctUMYUOA5CDhD1KZOpbngDz
 pjavT5AuCCHtbXP4EgnVMgbDsJA/jQ4vtbnM5XZM6FcHE1y2v36242Wlct/CjghppW0f
 /y67ZZdBPezmr6whkUPudoaZHaN1YgQL1GJfHxwMrqDFhRb5lej4SG2vt1IPRpG6mVmF
 zfDrrt9OLbfTpaDbfGNFejd++OqahCwqzCVkppC76DOck7ZNR7qkp06PvJeSSiS/4A86
 X6bJkyPqn7g2L8FqTaN3GmwY2Y1iJQLQif5ncV77E2ZFY0dppMWa/Sle2bArTEdGU9IO
 Q/Sg==
X-Gm-Message-State: AOAM531b3D/9Lbuyi3CLSs7UEfArEVFRxVIQbl4gr6NrnaJ6yOcsi3nQ
 YIXO8dMzPD4hduDqNThUnkA91A==
X-Google-Smtp-Source: ABdhPJwAh5eLMHrPai0VNx94cdnNrnhRTNrFKUwxQB4WkMTaZfdJFDFAoT2h4yBUrsqH2Gim34zjhA==
X-Received: by 2002:a65:6118:: with SMTP id z24mr8644793pgu.191.1608219856009; 
 Thu, 17 Dec 2020 07:44:16 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id na6sm4736607pjb.12.2020.12.17.07.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:44:15 -0800 (PST)
Date: Thu, 17 Dec 2020 15:44:11 +0000
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9t8y3rElyAPCLoD@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <471e0eb7-b035-03da-3ee3-35d5880a6748@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <471e0eb7-b035-03da-3ee3-35d5880a6748@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpvS9-000HIZ-7g
Subject: Re: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to
 F2FS
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Oct 10, 2020 at 05:53:06PM +0800, Chao Yu wrote:
> On 2020/10/5 15:36, Satya Tangirala wrote:
> > This patch series adds support for metadata encryption to F2FS using
> > blk-crypto.
> 
> It looks this implementation is based on hardware crypto engine, could you
> please add this info into f2fs.rst as well like inlinecrypt...
> 
To be precise, the implementation requires either a hardware crypto
engine *or* blk-crypto-fallback. I tried to clarify this a little better
in the commit messages and in fscrypt.rst, but thinking about it again
now, I think I should add a section about metadata encryption at the end
of f2fs.rst. I'll do that when I send out v3 of this patch series (I
just sent out v2).
> > 
> > Patch 3 wires up F2FS with the functions introduced in Patch 2. F2FS
> > will encrypt every block (that's not being encrypted by some other
> > encryption key, e.g. a per-file key) with the metadata encryption key
> > except the superblock (and the redundant copy of the superblock). The DUN
> > of a block is the offset of the block from the start of the F2FS
> > filesystem.
> 
> Why not using nid as DUN, then GC could migrate encrypted node block directly via
> meta inode's address space like we do for encrypted data block, rather than
> decrypting node block to node page and then encrypting node page with DUN of new
> blkaddr it migrates to.
> 
The issue is, the bi_crypt_context in a bio holds a single DUN value,
which is the DUN for the first data unit in the bio. blk-crypto assumes
that the DUN of each subsequent data unit can be computed by simply
incrementing the DUN. So physically contiguous data units can only be put
into the same bio if they also have contiguous DUNs. I don't know much
about nids, but if the nid is invariant w.r.t the physical block location,
then there might be more fragmentation of bios in regular read/writes
(because physical contiguity may have no relation to DUN contiguity). So I
think we should continue using the fsblk number as the DUN.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
