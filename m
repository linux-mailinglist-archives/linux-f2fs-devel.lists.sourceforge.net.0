Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C13152E25E2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Dec 2020 11:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SvO215wyasBM1s9Xib2QWGq9BnFY6ok4MKtNhZFLYA=; b=TrWe1fBFrOcepBSifKeWS6R2I
	ZoCcuS9SRkEg61SOY31a1UxpC64mwxdPErBAADh7Sql9YDt732xKEz2MwazwDTjeKVs6aKlqddj+/
	zuMzCon6j2kdpipuqGhEstH5HA22SiHAqQYu+bNThLuC05P0S6QV8c17EzwE2T8IUuBhY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ksNdU-0002X1-7N; Thu, 24 Dec 2020 10:14:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1ksNdS-0002Ws-8S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Dec 2020 10:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q9UsCaq19AZa2ox78ufqQlJ4vDMf1SOgSIwUYk8kOCo=; b=HSkZ7zXp5JYYBf0dRVsrgwzUlD
 dUk0F7rv8ILnh9HaH50P2LWRHVt6FLuBzRuYp7OP1pBDwDi4A056D3oL/+D+eJdPFfnOFMXtnsADK
 kBmEmt530t1Ppz+FaiTpDvAsJomSfp5o70/+SU4PevfgpdHmSE1I0VvAu0hn61Em07Os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q9UsCaq19AZa2ox78ufqQlJ4vDMf1SOgSIwUYk8kOCo=; b=jw8h8pJPz9LIy4ykX+6ipmUYA7
 JhQpFhdAR0AVboaBfpsMVaw5jOIiq6+CcxhmGBIdW+Ywmsofg6mzjNxHu2FV8zYZ1/1FcgTkzDn+3
 4weid0sS77C3ZWrfPfYyjYB7MnS7lT/xJcvvreD9VlzyjRIEkHjDP+WcN1bjQtR0yK7o=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ksNdJ-008nEv-OG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Dec 2020 10:14:18 +0000
Received: by mail-pg1-f177.google.com with SMTP id n10so1306129pgl.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Dec 2020 02:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q9UsCaq19AZa2ox78ufqQlJ4vDMf1SOgSIwUYk8kOCo=;
 b=nnVR1FwZPyr5Jv+aOxCHm7Aof9HxrtQNlgOKRlGUDHz5pKtlE2J/rjkv65PbbCLhqL
 3Wkx2Fcy1sgW6YJ4aYIg5JrGItOiS33slLlqlRp7lXNQSBSLJ3fePjTopNThsta+If9b
 smdSizxQ8z9rguoYkjUS2h/P0pLjVgpUtn8cfDvBF73YOeH7wsRA05C8Gy8nrFjy8X7p
 c4p7jGZtAINV/bPPAhXrD9YmQeI/ABvOE1YzeA2NfUN8HjwLVaUPrzUsD6bXNCyB5nbZ
 uQuCImdT5j1AL99flbVaJAIBs7DXGyp12cGhWueFRsX0oM710qfgLK4Hm7hykyyzlyRi
 RJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q9UsCaq19AZa2ox78ufqQlJ4vDMf1SOgSIwUYk8kOCo=;
 b=a/m2By896iwlMat9yqIpaLQ4z2KftZ3wIJTDuh+O65cnLJOrrec3mP83Sdc0quffCc
 T9vzGIezFKTx48dpQ+UesUJrrC42UQH9d++njuXuWxVKaywxACLyNS8o+ue+z1pF4p+N
 QJxhfCfYPyvuHdz9YspxdZYCzkPoVZS3+1INEG/PpJUoXcyWl5f9Q05kse6c/gLb5AOp
 T3j9B+R5V3ShnelWvsK9cHKcVNU3nCqbKaPPFI4GsY4tURGYbJsd6l2B/2arbxhumX1c
 dbS2JElonzZjD9/Yzba33BQCn/yyCkFj4vH6A/4LzTjekpWlWVDOHILZlFyz7Oig/bUt
 u/XA==
X-Gm-Message-State: AOAM530Az4Rwkqy75HTqh9CC2gcFsFqGlMf90H8JiFZaxL8/IGA2kz4K
 rhQIt/gX0XftVmueXLIUzbFf/9Gp0F9u6w==
X-Google-Smtp-Source: ABdhPJyexoKUu+zPfra+YE0JFY+DWyUSw9Y07WCOTW0eNxMYWN4AnFqYZKe5JyK9foCHkAbPt9mYBw==
X-Received: by 2002:a63:e02:: with SMTP id d2mr27908916pgl.34.1608804844027;
 Thu, 24 Dec 2020 02:14:04 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id g202sm25224414pfb.196.2020.12.24.02.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 02:14:03 -0800 (PST)
Date: Thu, 24 Dec 2020 10:13:59 +0000
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X+Rp579fp5sMDvSP@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <471e0eb7-b035-03da-3ee3-35d5880a6748@huawei.com>
 <X9t8y3rElyAPCLoD@google.com>
 <9a8d3ae2-a09f-f199-5cb1-48b1317b3d37@huawei.com>
 <X9yYVuuLt3/hL17J@google.com>
 <c08aadef-47a7-f6fc-c2fa-11393ca938e8@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c08aadef-47a7-f6fc-c2fa-11393ca938e8@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
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
X-Headers-End: 1ksNdJ-008nEv-OG
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

On Tue, Dec 22, 2020 at 07:47:45PM +0800, Chao Yu wrote:
> On 2020/12/18 19:53, Satya Tangirala wrote:
> > On Fri, Dec 18, 2020 at 05:02:23PM +0800, Chao Yu wrote:
> > > But, what's the plan about supporting software encryption for metadata? Current
> > > f2fs write flow will handle all operations which may encounter failure before
> > > allocating block address for node, if we do allocation first, and then use pba
> > > as IV to encrypt node block, it will be a little complicated to revert allocation
> > > if we fail to encrypt node block.
> > > 
> > Software encryption for metadata is supported through the blk-crypto
> 
> blk-crypto will encrypt all data in filesystem, if FBE is enabled, data may
> be encrypted twice?
blk-crypto will only encrypt bios as directed to do so by the encryption
context set on the bio. That encryption context is constructed by the
submitter of the bio - in our case, the submitter is the filesystem.
So the filesystem decides which bio gets encrypted with
which key/algorithm/etc (and in the current implementation, each bio
only supports a single bi_crypt_context, so *only one* layer of
encryption is possible with blk-crypto anyway). So no, data won't be
encrypted twice, because F2FS/fscrypt ensure that it does not (and the
filesystem knows exactly which blocks need metadata encryption, and
which blocks need FBE).
> 
> And why not supporting hardware encryption for metadata in blk-crypto? then
> both f2fs and ext4 can use inline-encryption based blk-crypto?
>
I may be misunderstanding what you're asking, but I think you're asking
why not make blk-crypto do metadata encryption (without explicit
involvement from filesystems)? Or more generally, why not do metadata
encryption below the filesystem layer?

As mentioned above, the filesystem is what knows which blocks need to be
metadata encrypted and which blocks need to be FBE encrypted (or even
just read without any encryption at all) - the block layer doesn't have
this information, and so can't effectively decide which blocks to use
the metadata encryption key on. Fwiw, Android does take a somewhat
similar approach to what you're suggesting here (I explain more in
detail in the cover letter for v2 of this patch series at
https://lore.kernel.org/linux-fscrypt/20201217150435.1505269-1-satyat@google.com/
). In Android, we have a new DM target (called dm-default-key) that adds
an encryption context to any bio that doesn't already have an encryption
context - so the assumption in general is that if the filesystem wants to
use an FBE key, it would have already set the encryption context on the
bio, so if a bio reaches dm-default-key without an encryption context,
it must mean that it needs metadata encryption. However, that assumption
doesn't always hold because F2FS sometimes needs to read the ciphertext
of FBE files without having the file's FBE key available - in those
situations, F2FS will send a bio without any encryption context, but
will also tell dm-default-key to *not* add the metadata encryption
context. That's a layering violation, which is why I'm not using that
approach here.

Does that answer your question? Or am I misunderstanding what you're
asking?
> Thanks,
> 
> > framework - so encryption will happen in the block layer, not the
> > filesystem layer. So there's nothing extra/special we need to do if
> > there's an encryption failure - an encryption failure is no different
> > from a read/write failure in a lower layer from f2fs' perspective.
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
