Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39911EB896
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 21:51:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQHPV-0003Sz-Ie; Thu, 31 Oct 2019 20:51:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iQHPU-0003Ss-4q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 20:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/4+IvfMeMm2ckRx+frtvIwQD5KvpjVJErXCvBLwrIGs=; b=Kfe/4bIboxXyc1HOz6BKCaJyAH
 KtzYU/2VaB8afsgFEd90jsg/wLZddwdj12s/e0hEqKKKy8D/NCVMPhEPb0gjE2UTBuq6IRDkQFJSd
 gdKoiGabyPhLCpE3rp8CIMzvaCEGAyz5ZgXunRCLIZWbeJtYt7f4fed5Wbrha5HKABRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/4+IvfMeMm2ckRx+frtvIwQD5KvpjVJErXCvBLwrIGs=; b=R0CDn1jiCACuLSrVM+6KM/xmko
 fMj9nbMIiuNu+6siF8TMppeN488Vzbf9UaqkYkNUvWFOef+bAMcrpjdItyAYWQNJaDo6/fDCxDnfA
 51LzwA1XJBD+HzMt2gwCLlKL8OVoTFaf4Tg/NV3oR9B7mz7kYJRP+6NU5AivC/HU/K6U=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQHPP-00BLZa-Fo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 20:51:12 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9VKojQo005383
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 16:50:46 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 11FEB420456; Thu, 31 Oct 2019 16:50:45 -0400 (EDT)
Date: Thu, 31 Oct 2019 16:50:45 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191031205045.GG16197@mit.edu>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-4-satyat@google.com>
 <20191031175713.GA23601@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031175713.GA23601@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQHPP-00BLZa-Fo
Subject: Re: [f2fs-dev] [PATCH v5 3/9] block: blk-crypto for Inline
 Encryption
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 10:57:13AM -0700, Christoph Hellwig wrote:
> On Mon, Oct 28, 2019 at 12:20:26AM -0700, Satya Tangirala wrote:
> > We introduce blk-crypto, which manages programming keyslots for struct
> > bios. With blk-crypto, filesystems only need to call bio_crypt_set_ctx with
> > the encryption key, algorithm and data_unit_num; they don't have to worry
> > about getting a keyslot for each encryption context, as blk-crypto handles
> > that. Blk-crypto also makes it possible for layered devices like device
> > mapper to make use of inline encryption hardware.
> > 
> > Blk-crypto delegates crypto operations to inline encryption hardware when
> > available, and also contains a software fallback to the kernel crypto API.
> > For more details, refer to Documentation/block/inline-encryption.rst.
> 
> Can you explain why we need this software fallback that basically just
> duplicates logic already in fscrypt?  As far as I can tell this fallback
> logic actually is more code than the actual inline encryption, and nasty
> code at that, e.g. the whole crypt_iter thing.

One of the reasons I really want this is so I (as an upstream
maintainer of ext4 and fscrypt) can test the new code paths using
xfstests on GCE, without needing special pre-release hardware that has
the ICE support.

Yeah, I could probably get one of those dev boards internally at
Google, but they're a pain in the tuckus to use, and I'd much rather
be able to have my normal test infrastructure using gce-xfstests and
kvm-xfstests be able to test inline-crypto.  So in terms of CI
testing, having the blk-crypto is really going to be helpful.

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
