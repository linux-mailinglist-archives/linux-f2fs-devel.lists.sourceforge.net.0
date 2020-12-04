Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 406162CE8B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 08:43:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl5ks-0005uV-8S; Fri, 04 Dec 2020 07:43:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1kl5kq-0005ty-AK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 07:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IqdvRnOhlGCkzmVPkbqMAXPRan58Ybj/VKoMtVNtTfs=; b=kKxEG5idqH+67kSBaTeW6zHRj3
 VGt9JvMywmYwVpsTlO62cLNcIvzl/HtPATyabHT+yrW0lQ+ucFRANagLsSzvqeLNBWAMFbD3+s1rJ
 zdYH/mNvc/ipIWojIaciHNQWUQPkErHevNKxnLR+ALeYDPb6V/0pq2gUKNle/v6yzqLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IqdvRnOhlGCkzmVPkbqMAXPRan58Ybj/VKoMtVNtTfs=; b=L3DgJ8ul6OQZtezGAIHH/DKve3
 z6fHryjfBR87f9tQ+NuF20avyGcXa2zJHNkbh2ehouHrAhJoDwIKmdLpgMjbxXabeIMh41CMWUX1v
 H1RxXqG6qNy8pMeIIIp72XEQt5iBT64rtDQSBFRHqg3WOt+fzYcBM7vgev8yJSrPI48Q=;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kl5km-001GXw-Hs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 07:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607067818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IqdvRnOhlGCkzmVPkbqMAXPRan58Ybj/VKoMtVNtTfs=;
 b=CdVrY4ecpc/+MPMoUVfzLT4NSn7yCgVRgBq9eC2LegaXQ2bkS6ztR7HODmJfi9jn1HDloR
 dwgAajzbljZ5fmPXrKObWJ30cMGrZ+XeaYrbsMVXbj1ys1Ffo3/WG6KK4FzmIgT7E6n1un
 VHtyeGaEBzLlJsVB1gMHT8XO0xo6jBA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-TVbOj-BYPPKGTIE1oSfM_A-1; Fri, 04 Dec 2020 02:43:36 -0500
X-MC-Unique: TVbOj-BYPPKGTIE1oSfM_A-1
Received: by mail-pg1-f198.google.com with SMTP id s192so3046939pgc.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 23:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IqdvRnOhlGCkzmVPkbqMAXPRan58Ybj/VKoMtVNtTfs=;
 b=J5wN+tX4e1U6TyBpEx0qCnlT+yZJdILt+c3VQqSQMOfnpS+1tqsuD/pNCAp/6R6gyH
 y3evP8AwN/UmRDoi4Qo3SI3zT1bRHSVdR9zVTrNvsuIhbZe0fk8mSWvidUiJhovKOvDU
 AufJ1qFHA/y1Yllyo9osXX9uju6hG41DwgLbeu0z31fjfQcw7W5A9aeysD1ikBqa/wr4
 LM+PQal0Ni1RzJuD7iCTOKmVazx2iXpdsw94iXcplpslWNrEfuXxRDclCrV3K29Y0TSM
 NW/VZT8uitl0kISDPFiR6u8O3kUdEF01Q1fTRYrmAoXyhy2QxsFd7Jd0Fprme2T5EsRJ
 lGvg==
X-Gm-Message-State: AOAM532qGl3wsQ+JCu3SQDAgzPQNyTmO74sTGgVylR1Mg1A+gNNO0AiL
 2OefL2MGqNjD01Ssjix4irlkqexMSV6PHUPmHrm1ZgOlXNduC1D+GHBYy+FVVXWHejSKTn4dmsQ
 6XvjltVWYm/TDqoeetzrUysaMPTpzjcX+9L8r6A==
X-Received: by 2002:aa7:9606:0:b029:19d:c837:d69b with SMTP id
 q6-20020aa796060000b029019dc837d69bmr197055pfg.46.1607067815419; 
 Thu, 03 Dec 2020 23:43:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytbhugDS4EGhOvmv/brSip62BEJbJvunGvWe/PL9YPtQTR/GAbXuWKNgU2/lPJSgfSDozNJA==
X-Received: by 2002:aa7:9606:0:b029:19d:c837:d69b with SMTP id
 q6-20020aa796060000b029019dc837d69bmr197039pfg.46.1607067815150; 
 Thu, 03 Dec 2020 23:43:35 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x16sm1315706pjh.39.2020.12.03.23.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 23:43:34 -0800 (PST)
Date: Fri, 4 Dec 2020 15:43:23 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201204074323.GA2025226@xiangao.remote.csb>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com>
 <20201204003119.GA1957051@xiangao.remote.csb>
 <d713f69b-af1b-4e4a-41ad-267a3b9026ac@huawei.com>
MIME-Version: 1.0
In-Reply-To: <d713f69b-af1b-4e4a-41ad-267a3b9026ac@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.205.24.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.205.24.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl5km-001GXw-Hs
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

Hi Chao,

On Fri, Dec 04, 2020 at 03:09:20PM +0800, Chao Yu wrote:
> On 2020/12/4 8:31, Gao Xiang wrote:
> > could make more sense), could you leave some CR numbers about these
> > algorithms on typical datasets (enwik9, silisia.tar or else.) with 16k
> > cluster size?
> 
> Just from a quick test with enwik9 on vm:
> 
> Original blocks:	244382
> 
> 			lz4			lz4hc-9
> compressed blocks	170647			163270
> compress ratio		69.8%			66.8%
> speed			16.4207 s, 60.9 MB/s	26.7299 s, 37.4 MB/s
> 
> compress ratio = after / before

Thanks for the confirmation. it'd be better to add this to commit message
if needed when adding a new algorithm to show the benefits.

About the speed, I think which is also limited to storage device and other
conditions (I mean the CPU loading during the writeback might be different
between lz4 and lz4hc-9 due to many other bounds, e.g. UFS 3.0 seq
write is somewhat higher vs VM. lz4 may have higher bandwidth on high
level devices since it seems some IO bound here... I guess but not sure,
since pure in-memory lz4 is fast according to lzbench / lz4 homepage.)

Anyway, it's up to f2fs folks if it's useful :) (the CR number is what
I expect though... I'm a bit of afraid the CPU runtime loading.)
Thanks for your time!

Thanks,
Gao Xiang

> 
> Thanks,
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
