Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833C140580
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 09:32:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isN3U-0000vt-SS; Fri, 17 Jan 2020 08:32:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+99029fa5cb4ba764ed81+5990+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1isN3P-0000v3-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 08:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9Ep/eeYbaIxxVmlhJEobd6cxmZ0LGEzXqlvP1MkkLE=; b=fGdOSlLJAIoX8TzC9iKT8G+Ili
 vkRfRdWklKdP77905PZ9xvAt06AKVsOLhQwRLOzymQtKbPF8BtKAHxYsMPUWS2Th5FosWjL80B+Ue
 1G2kSRLSb4sN/vRaZwOrRiQSD30snt0cEXTVNfTeuNLM62STNVf16jtOYZ4teqs0tNXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y9Ep/eeYbaIxxVmlhJEobd6cxmZ0LGEzXqlvP1MkkLE=; b=MbcjylPo0IHrOxYNtf6jMEZGtW
 qAVyEF4Qg3U582RPpHiZT3dc8kQyFVkWFNeQW0Fq56W/+bJyaNM0l1BL77C6C74S+zrXBoHuFB02m
 eu9vVL0n/yIu9MB3DfywukvW4yrcSWDmJfsw0/NG+KyAQInJbPuPUrkAwprCRKAiFUZw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isN3O-00AvXa-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 08:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9Ep/eeYbaIxxVmlhJEobd6cxmZ0LGEzXqlvP1MkkLE=; b=Tpb+CKn0VYnlSFFimCbPKAl7h
 NZt0oWSreQSTUNdpWR/rpSkjPMbJwbLyrAXp0GXq85PtjBXoFw1Nb17SKs1nb5c+lJDtvebqaP6Nn
 PJ3v9S6vdmcJ81DbbxbqxjY8815Mn4BGtmTDozpzMMRhnF1qTOr+AfAu59zqZPjRG2rgRvwDB1W3D
 I35Kd62ZVVxFsEssqdYG5Ss2a9MA70WeqsGgU19KnbRkhtdLVkZ+munwtJYkhd/4VFVgZAJCn+Ed1
 8mVPnJ5nfpCrYyOiUTPWXC88Fl42EawWl32m5908L829v3FaylM7QIRNMMmEaG0oa96IcftbBfqbS
 vmrXSPRBA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1isN3F-0004ZQ-RD; Fri, 17 Jan 2020 08:32:21 +0000
Date: Fri, 17 Jan 2020 00:32:21 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200117083221.GA324@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
 <20200108140730.GC2896@infradead.org>
 <20200108172629.GA232722@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108172629.GA232722@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isN3O-00AvXa-Hb
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: linux-block@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On Wed, Jan 08, 2020 at 09:26:29AM -0800, Eric Biggers wrote:
> The NVMe "key per I/O" draft is heavily flawed, and I don't think it will be
> useful at all in the Linux kernel context.  The problem is that, as far as I
> can tell, it doesn't allow the encryption algorithm and IVs to be selected,
> or even standardized or made discoverable in any way.  It does say that
> AES-256 must be supported, but it doesn't say which mode of operation (i.e.
> it could be something inappropriate for disk encryption, like ECB), nor
> does it say whether AES-256 has to be the default or not, and if it's not
> the default how to discover that and select AES-256.

I've talked to people involved with the TCG side of this spec, where
all the interesting crypto happens.  Currently the plan is to support
KMIP wrapper keys, which specify the exact algorithm and operation
mode, and algorithms and modes for the initial version are planned to
be AES 256/512 XTS.  I also had a chat with an involved person and
they understand the principle that for the inline crypto to be trusted
it needs to be interoperable with (trusted) software algorithms.  So
I don't think it is all doom.

> IV generation is also unspecified, so it
> could be something insecure like always using the same IV.

From talking to one of the initiators of the spec, no it is not intended
to be unspecified, but indeed tied to the LBA (see below).

> Also, since "key per I/O" won't allow selecting IVs, all the encrypted data will
> be tied to its physical location on-disk.  That will make "key per I/O" unusable
> in any case where encrypted blocks are moved without the key, e.g.
> filesystem-level encryption on many filesystems.

File systems don't move data around all that often (saying that with my
fs developer hat on).  In traditional file systems only defragmentation
will move data around, with extent refcounting it can also happen for
dedup, and for file systems that write out of place data gets moved
when parts of a block are rewritten, but in that case a read modify
write cycle is perfomed in the Linux code anyway, so it will go through
the inline encryption engined on the way and the way out.

So in other words - specifying an IV would be useful for some use cases,
but I don't think it is a deal blocker. Even without that is is useful
for block device level encryption, and could have some usefulness for
file system encryption usage.

I think that adding an IV would eventually be useful, but fitting that
into NVMe won't be easy, as you'd need to find a way to specify the IV
for each submission queue entry, which requires growing it, or finding
some way to extend it out of band.

> I've already raised these concerns in the NVMe and TCG Storage working groups,
> and the people working on it refused to make any changes, as they consider "key
> per I/O" to be more akin to the TCG Opal self-encrypting drive specification,
> and not actually intended to be "inline encryption".

While I have my fair share of issues how the spec is developed that
isn't my impression, and at least for the verifyable part I heard
contrary statements.  Feel free to contact me offline to make sure we
can move this into the right direction.

> So let's not over-engineer this kernel patchset to support some broken
> vaporware, please.

Not sharing bio fields for integrity and encryption actually keeps
the patchset simpler (although uses more memory if both options are
enabled).  So my main point here is to not over engineer it for broken
premise that won't be true soon.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
