Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E159A596
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 04:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBXj+4v1p3bfuqyzsiz9w6h/LAPNePRgB27C1FjXLB4=; b=RNXJ61sdfwfmyrgzTc51o/NpzX
	DsC+dewTIZlxIXDEb42o6LmGNlDYAX6HxDuMTTO6iNUlN7I6rKrpY3eGj2jLM9n9JU7Btufqeo4Av
	AIAXE8JJDwLMqzZo354mAk3UK1fG8fiIvE4JWfXlmBRD85bD52Zqg3NmnLwT3ajr+Zr8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0zQO-0003e9-Vu; Fri, 23 Aug 2019 02:35:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1i0zQN-0003e2-BP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 02:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Ob+A4xxX2bRSxLGz92/UzTEvC1yWM8JcjhiXKDPfB8=; b=mp4keepfoumFN4K6idh9hwrozh
 wTnYrehJwS7HifNCm4apjlcU0mkapy/NPxw0dGgRdKObfbPC1T0OzqdfVllQ/Hu/XyQWhDXCj/dQ9
 +YCvkl1A7danMmFKQ7GhoO+KwFc9K37dFTBEfUs+AKSFX7dBi14JXydUs1sdTXkkCyTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Ob+A4xxX2bRSxLGz92/UzTEvC1yWM8JcjhiXKDPfB8=; b=B+7/L6UmxOwswuVRLIZJWD2JRw
 H/jLtclDDy0eaE1izp/t4x2LvZC/oXj20OUI1pUFoRkSi7h/f6bNr6SOZIL1PtUWXlWenM6eV3bfy
 aDiGrCw5mR+/wJ6zmJr0LzNww8EbSvnCCfsvMHgoAF/uJBj4/oMcbSfSWao8TMdzKyhE=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i0zQL-00Glxn-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 02:35:35 +0000
Received: by mail-io1-f65.google.com with SMTP id o9so16625295iom.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Aug 2019 19:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Ob+A4xxX2bRSxLGz92/UzTEvC1yWM8JcjhiXKDPfB8=;
 b=flcLM5FZxA1UdTl+5MfostzBYwQfyv1yb87DaSzrnDrUwd/ZNj4K4T/rHszC/sFQMH
 ADUFV/N/N6vulg+PsFB9LiJOba7WYzMsXqe7TkwmxiwQw++HUI5Q9lwxgsadqj5kp36o
 7ir9Ftxz3Frpzbh7dbD9IWl/fAPy+uyEwFD9Qu0xwImVT/66UuNo3m+3vDu9rqcZdHGP
 dJuOAFAhp3e0iD0AWnqz3VAQtqcjnUDCLFkZZiPVDrJq83kU9d3bg+KlteAnZK+XFKE6
 M2BK3WAwQy2tydaBr0xJ2dcLV8QJVxM3CxkgnlBsNXoibdFYaWIIutqUzeXdd2gExoTy
 FEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Ob+A4xxX2bRSxLGz92/UzTEvC1yWM8JcjhiXKDPfB8=;
 b=DoIE3x2yawfOaRskRzhLP12bcbZSSA0P6CdJ+kPTrppdVo2K7KGEF+P3hTUwJHeMJ8
 l18bMY66QPFWuq19/q1fsk+k9UdspWXXT70rHCJ9R82Aj7/tU81TgN0OG6sIj/7yRRnO
 uvOw6tG7NhAYvke9PppKQ8T7jhjJsGHMJM+4eu5rpgtseJKaH7ToxYMdnwx7zEZNinno
 o+ueW94hXdvatpCkMOAQ4TCBtTU6z/4zZD9riKKzHZ/Da9keUpXZNLc0Gj1Ag96Svgwi
 U8qMryXn7CCbTiepidfim8Y3C0KH7zOyzG7dtwGJXDAAFq4O8ZkJA8dxyzsfRNprx91K
 cCIQ==
X-Gm-Message-State: APjAAAXy5NOdSiP9ya8cBpNA3lMNrp+abQWFh4TAgUzhWiPBPE19V1Nm
 lGFVAJM0T8OXApAsjXRmY6v8pztXBEo55YBQBcxxBA==
X-Google-Smtp-Source: APXvYqxk0KBtXTDXCH7sq1BDWGn2tzcj3BOrK9VJXXJYjin28Niwi8IhH6bIWJT+jY7Hn20R6XsnRrLk/vFE/AUzyqo=
X-Received: by 2002:a6b:c581:: with SMTP id v123mr3719443iof.158.1566527727590; 
 Thu, 22 Aug 2019 19:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190821064226epcas2p2835b8a9084988b79107e54abfc5e7dab@epcas2p2.samsung.com>
 <004101d557eb$98b00060$ca100120$@samsung.com>
 <6ea5e5db-4dd4-719f-3b3e-b89099636ea6@kernel.dk>
In-Reply-To: <6ea5e5db-4dd4-719f-3b3e-b89099636ea6@kernel.dk>
Date: Thu, 22 Aug 2019 19:35:16 -0700
Message-ID: <CAA+FYZc6G0xk7Dhx0b9xNRoK+b+DpfuS+OK4wn4bpKpFPiiGUQ@mail.gmail.com>
To: Jens Axboe <axboe@kernel.dk>, boojin.kim@samsung.com
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0zQL-00Glxn-Nr
Subject: Re: [f2fs-dev] [PATCH 5/9] block: support diskcipher
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alasdair Kergon <agk@redhat.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 "Theodore Y. Ts'o" <tytso@mit.edu>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 21, 2019 at 5:10 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 8/21/19 12:42 AM, boojin.kim wrote:
> > This patch supports crypto information to be maintained via BIO
> > and passed to the storage driver.
> >
> > To do this, 'bi_aux_private', 'REQ_CYPTE' and 'bi_dun' are added
> > to the block layer.
> >
> > 'bi_aux_private' is added for loading additional private information into
> > BIO.
> > 'REQ_CRYPT' is added to distinguish that bi_aux_private is being used
> > for diskcipher.
> > F2FS among encryption users uses DUN(device unit number) as
> > the IV(initial vector) for cryptographic operations.
> > DUN is stored in 'bi_dun' of bi_iter as a specific value for each BIO.
> >
> > Before attempting to merge the two BIOs, the operation is also added to
> > verify that the crypto information contained in two BIOs is consistent.
>
> This isn't going to happen. With this, and the inline encryption
> proposed by Google, we'll bloat the bio even more. At least the Google
> approach didn't include bio iter changes as well.
>
> Please work it out between yourselves so we can have a single, clean
> abstraction that works for both.
>
> --
> Jens Axboe
>

Hi Boojin,

We're very keen to make sure that our approach to inline encryption can
work with diverse hardware, including Samsung's FMP hardware; if you
can see any issues with using our approach with your hardware please
let us know.

We understand that a possible concern for getting FMP working with our
patch series for Inline Encryption Support at

https://lore.kernel.org/linux-block/20190821075714.65140-1-satyat@google.com/

is that unlike some inline encryption hardware (and also unlike the JEDEC
UFS v2.1 spec), FMP doesn't have the concept of a limited number of
keyslots - to address that difference we have a "passthrough keyslot
manager", which we put up on top of our patch series for inline encryption
support at

https://android-review.googlesource.com/c/kernel/common/+/980137/2

Setting up a passthrough keyslot manager in the request queue of a
device allows the device to receive a bio's encryption context as-is with
the bio, which is what FMP would prefer. Are there any issues with
using the passthrough keyslot manager for FMP?

Thanks!
Satya


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
