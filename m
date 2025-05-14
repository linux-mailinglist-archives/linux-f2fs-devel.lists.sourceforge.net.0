Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C64AB7044
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 17:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlMRcddhkz5Z0tIVb50K2dVO052Vtz8Zn86qdqlTsDs=; b=InccPzzcGDSRRLbRv9Mf04rIwQ
	wYcBiwceSisPkbmjbhga1w864ZO1zmmEBJDXaarlZaaK02ugIDOBaaOLUfpqPqWKdlOTfEMceVLhN
	E+PwCoVrpD+GPkM3phFbyJH28BLrK9Gb7rIK2hgBQ7bbqTxm/gMEC6czyJI8nrEM8gvA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFEKR-0000mj-V7;
	Wed, 14 May 2025 15:47:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uFEKQ-0000mW-0j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jU28VTGkYq3grG2ezVmpkoqsdw/v8m5FZ2T6NAgVL7A=; b=jIRzVONi9UbU5Xv30j8leOODwt
 NFNYhYXwnk8xa9NmDkj30vpziCHaFHFykLWRwOme25u3ev7GEu2nxA5Vbp+eTOFb7P/HSinaFGiiW
 DBVT0vzo1ENcqZfLBGrNPaDkU6yYLTLkosxs/eIjt+HG1nyKjazlHjEDhJxYAy7Qu4EI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jU28VTGkYq3grG2ezVmpkoqsdw/v8m5FZ2T6NAgVL7A=; b=VaIZaQYG+0GG9NvXjRoPMXp1oB
 IJ6JQIqv61JSqw9fCRpSyZy2itz9CKPVYKlfdTiQz4dJgYSKapk+JgxFQRXS3uWuGfkExfUM+crii
 73EmhNOs6bjmUbQfaF3uopXdOGpPDXuqoOOgzeZgWXmly27nWs3zE75ZQeiHFduqhL6o=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uFEKP-0002z1-C9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747237643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jU28VTGkYq3grG2ezVmpkoqsdw/v8m5FZ2T6NAgVL7A=;
 b=ZxeXuXaa2sZSi4AdT39rWwEW9DAuDu2XuIEd7dPXyl63tVPxz9DXNtHJ4gc6h4YHwYA6ry
 kJOpi+sKLag37rf//hobvSzGId0NsZIBPVYs8CxquJ6Bs8oWQKvq6WJ1fEzzPmYiADLQea
 bESjiby6L/VfZouuUsvz+x3Xvhq3DN4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-jkYXOQRwMpyrZe9is1Yutw-1; Wed, 14 May 2025 11:47:22 -0400
X-MC-Unique: jkYXOQRwMpyrZe9is1Yutw-1
X-Mimecast-MFC-AGG-ID: jkYXOQRwMpyrZe9is1Yutw_1747237641
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-72bd7984706so6476001a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 08:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747237641; x=1747842441;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jU28VTGkYq3grG2ezVmpkoqsdw/v8m5FZ2T6NAgVL7A=;
 b=vm3WCnZ4+7Bc8dvxRjTCRS0s2gEPfW9iaZqZFUp6W7XBO/9dzHtW4SN7B3r5ujrGCK
 lKyULgl2D/2IHaeHzZjrCXjQ0Q1PbZEr+ruh0/zM0v6pkGzNeKIdLSxgq12WLi/rGcxp
 Xz1YVMLa9dCcLABGvPqDw0D2DinW3qqnlxcSM09FOcyfn4DOeBJIpLu40l9VtiHoyDyD
 X5xygq6eKKd5RwJE+WA7swZanWYj4rkgIXs2is0OxWeKvvYhzoprpRGR3zq0RVf+bnD3
 lyxYluKWp2k+PmE36yjm1h63Hup1oQZq8FD43O8MwclzaOCqqcskZHBANSBde7bxLelQ
 lJ/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoevvd8uIj1X2NUCWvexKE6YtaTBKpCpz5iRa8Y7Ix33irOyD5KXqipawORFtsygHCK0HfLq5eFaNlLyv5eDQA@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywsu9Jf6WzSrjtKTmIyXD4hKyLTfdYPCUrhXvJql+otcgYOF/Rf
 NtgT+ooK7pljSDrD8YKRE8BOnL+qs1Pk2tEMSL1zYy8g/xe70j7gyXrtY+2MAYs+Q3BsEbxvhnH
 Mw2Usdy19nawJizdK472kkGhai/9pQFgRtZEfDF3r0bOKYhvpyFUjb9yA/F2+NJwDCmUYi2saWs
 TlyeT0+ur5/Q==
X-Gm-Gg: ASbGncu9bhYAS3Vb0Sw+srw0D0PWB94ElRl7cIozzZcqomkqqBZDlR2X1G6NLD7DHoP
 rHX1xBywfhg5g7oicvMxPfOvqZJeTL6odBYhGJf/mo4zbxQEQ0wN4BHHbivQsALVakSsLseK/Pt
 3n7S4/hh4x+kTKTDnEBKBbc3W3vdEkl02bI5dlu/J4wlJDyWD2/bIM7gMpm/ie6767MHuqg4jyi
 oS13ghZfIgvld/dd6hprK2sDbi02H5Y/PjNoVmWzpdnzqtrr2xRmy9SOx4NlKbgwpzouh+wCGS0
 fefbw8W4AIWChjO4G/rg/8Hb1Q==
X-Received: by 2002:a05:6e02:258e:b0:3d9:6cb6:fa58 with SMTP id
 e9e14a558f8ab-3db6f7fd583mr40761785ab.17.1747237630251; 
 Wed, 14 May 2025 08:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIDAy+HmwZb2EsEeKV8L3mmlCckkvW79UY/GUeR7NNUr5jpZc1ELCAL2keTsiIBmKvh647UQ==
X-Received: by 2002:a05:6602:408a:b0:85b:3f06:1fd4 with SMTP id
 ca18e2360f4ac-86a08e501a6mr479793839f.9.1747237619557; 
 Wed, 14 May 2025 08:46:59 -0700 (PDT)
Received: from [192.168.1.112] ([75.168.230.114])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8676356c914sm274685239f.7.2025.05.14.08.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 08:46:59 -0700 (PDT)
Message-ID: <77ba158a-86f4-4a55-867e-f27a55818b2e@redhat.com>
Date: Wed, 14 May 2025 10:46:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Hongbo Li <lihongbo22@huawei.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <ff2c9a74-f359-4bcc-9792-46af946c70ad@kernel.org>
 <63d1977d-2f0b-4c58-9867-0dc1285815a0@huawei.com>
 <979015aa-433d-4057-a454-afaea2c68131@kernel.org>
 <2ea178cb-1ed3-40ba-8dc6-8fa3bff06850@huawei.com>
 <aCS3LZ3IOMgiissx@google.com>
In-Reply-To: <aCS3LZ3IOMgiissx@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G5ZQxPJmTPgNtvc2LVupTIx0_l5toRMdD24Z7r1_2Eo_1747237641
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/14/25 10:30 AM, Jaegeuk Kim wrote: > Hi, Hongbo, > >
 It seems we're getting more issues in the patch set. May I ask for some >
 help sending the new patch series having all the fixes that I made a [...]
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [170.10.133.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uFEKP-0002z1-C9
Subject: Re: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/14/25 10:30 AM, Jaegeuk Kim wrote:
> Hi, Hongbo,
> 
> It seems we're getting more issues in the patch set. May I ask for some
> help sending the new patch series having all the fixes that I made as well
> as addressing the concerns? You can get the patches from [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test

Apologies for being a little absent, some urgent things came up internally
for me at work and I've had less time for this. I'm planning to get
back to it!

It's been a long thread, perhaps we could summarize the remaining questions and
concerns?

And I'm sorry for the errors that got through, I really thought my testing was
fairly exhaustive, but it appears that I missed several cases.

(To be fair, f2fs has far more mount options than any other filesystem, and
combining that with on-disk feature variants, it is a very big test matrix.)

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
