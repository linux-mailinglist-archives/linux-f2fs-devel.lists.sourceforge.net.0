Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3B2CE66D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 04:22:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl1ft-0000P4-RV; Fri, 04 Dec 2020 03:22:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1kl1fs-0000Or-B8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 03:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GCINrh3VNpkGouXddHNxS7sFf+jq22dtzVWiRPWZKl8=; b=WP4xGvMGchF4ADjxV4c83206qk
 zUnhSj8gC9dq28BU1DmeiHxujMsyTAmO7CzcoA/Y+YYPExCt2hIyaoGDwLdfMlgpggIyzmoY/3y13
 mNp4R2Muyr0+HNKn+eePvqsuIR6amlyAXulFoci7HiGLSbVMZIsdZKuDfXoQUlTIdQy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GCINrh3VNpkGouXddHNxS7sFf+jq22dtzVWiRPWZKl8=; b=YvUpYrRciveg0Ff7wWAektSMIK
 Cj+9aUhil9rtDQwWIMq6TzvEZZW9SN11Uet1fvVnPCaN1pd1SfED4nKlH6gXV2LBy0vCIC19Cl6Ae
 IPrOe6ZEMX3NWCZoQLe5AeXtPxuwLq0JcGJ/NGwFGfHjzByR8+BD4u9kSgMqMlqUdmMk=;
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kl1fb-00EN5s-6e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 03:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607052113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GCINrh3VNpkGouXddHNxS7sFf+jq22dtzVWiRPWZKl8=;
 b=PaEMZrlUiUGQArumsx3X+cbMMHXNinzd+ofs0JsMW9AQMvmRYe19ISMEc6jdEr/sWANDSJ
 pxQtxkNs6BR4rqH+oU1BJfFG+HAB/wwff15YS/mWIOg0JAgE1nxNgpqjqwLkKXmUAOzJha
 E5b0sIEs/zzYJ1N3MVqBzbltk1Hd+5c=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-6llGA8oANM6N7QvM0uO3ZQ-1; Thu, 03 Dec 2020 22:21:52 -0500
X-MC-Unique: 6llGA8oANM6N7QvM0uO3ZQ-1
Received: by mail-pf1-f199.google.com with SMTP id l11so2784321pfc.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 19:21:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GCINrh3VNpkGouXddHNxS7sFf+jq22dtzVWiRPWZKl8=;
 b=RZ02KjK+7IROcyAkKzKx8AS0PgzvI1OiIU+UAQGKA4iIi2dOd6bOamyt42aX8t0OtX
 LVbM2eGbFnyuQicMfloO0Druh/LIX2teBvgfJ3gjmwMEJqrs5hUGSW2epDY6Wogx6lo9
 6pyTF5eUxNdivbPtYPj7vzVD+uqKHpq3vM643J5NZEpgwtMRFD15JvkRxofw43LOeCb5
 VHeo9WL4qazCwNsOT5HSat+gRIsPnYlPpsNXj/b5HA1mAYMMwIK0K2rPtx86InehZKE9
 JwFz/Nn/Q3Fq+2VRkn4aQssMETfl/4qcu1LKZGagp2NIUKRQQU0laX1jCc8iMiEZ7tkk
 idyQ==
X-Gm-Message-State: AOAM533QwbjrUONghPtNzi5gUogaUnG5YqYVydyxgp8i9pHyPNt1xF8c
 VkwZFX7idPe9UwQkOAJzPMsSLkPHhPIht+9Y5GpPXSK4q/6ha9U+rrU6glBuLHs2kF2VCnVxOix
 rDx4A/9Wlq/HJ3Fg5yov2B0kvrxRfwljzkOCg+A==
X-Received: by 2002:aa7:8f35:0:b029:19b:1258:ec5d with SMTP id
 y21-20020aa78f350000b029019b1258ec5dmr2079492pfr.9.1607052111357; 
 Thu, 03 Dec 2020 19:21:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2VxNKUALmnFA+8MX11vWPTJT60okdryyGIBTDAupAp6zmoczzVNWutiMV27zPuUM1/ie90Q==
X-Received: by 2002:aa7:8f35:0:b029:19b:1258:ec5d with SMTP id
 y21-20020aa78f350000b029019b1258ec5dmr2079481pfr.9.1607052111126; 
 Thu, 03 Dec 2020 19:21:51 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i123sm624927pfb.28.2020.12.03.19.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 19:21:50 -0800 (PST)
Date: Fri, 4 Dec 2020 11:21:40 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201204032140.GD1963435@xiangao.remote.csb>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com>
 <20201204003119.GA1957051@xiangao.remote.csb>
 <7b975d1a-a06c-4e14-067e-064afc200934@huawei.com>
 <20201204020659.GB1963435@xiangao.remote.csb>
 <3041968d-87d0-d2dc-822b-0bb4a94a365b@huawei.com>
 <20201204024746.GC1963435@xiangao.remote.csb>
 <15afffcc-636d-b678-0c01-b2fad98d9311@huawei.com>
MIME-Version: 1.0
In-Reply-To: <15afffcc-636d-b678-0c01-b2fad98d9311@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [63.128.21.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [63.128.21.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl1fb-00EN5s-6e
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: support compress level
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
Cc: Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 04, 2020 at 11:11:03AM +0800, Chao Yu wrote:
> On 2020/12/4 10:47, Gao Xiang wrote:

...

> 
> > future (and add more dependency to algorithms, you might see BWT-based bzip2
> > removal patch
> 
> Oops, is that really allowed? I don't this is a good idea...and I don't see there
> are deletions from fs/ due to similar reason...

Fortunately, bzip is quite slow algorithm, so not affective at all.

My personal opinion based on compress algorithm principle (just for reference
as well...)
 - zlib should be better replaced with libdeflate if possible, the main point
   is that many hardware accelerator for deflate (LZ77 + huffman) are
   available;

 - lzo is not attractive from its format complexity and its CR/performance
    goal so lz4 is generally better due to its format design;

 - lzo-rle, oops, just introduced for zram I think, not sure quite helpful
   for file data (since anonymous pages are generally RLE-effective due to
   many repeative data.) But it'd be good if lzo author accepts it.

Thanks,
Gao Xiang

> 
> Thanks,
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
