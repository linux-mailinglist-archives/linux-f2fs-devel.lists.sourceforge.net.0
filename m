Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 219616D79D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 12:37:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk0W1-0000EB-OR;
	Wed, 05 Apr 2023 10:37:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pk0Vh-0000Dh-O9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 10:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=; b=HyPsrhc0Uej9vNK8t9SWMW+3z3
 CfEtlV6Xhxpy8vjAOdPLpUtMlJm11zGVKhcAbxcpyrrv5wdA4LQsl4QLpWgNKI5zS9NmwMbEEdbTa
 KUGwWLmFMSjO3N8z2tsmdoHxPvknqdPO8+4NJC2Wyy2p0vrtcxgTZ1cc3aRBHyqUBw/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=; b=EC4We6gHp7xDUjARgoQcRN54AI
 1+8Eu4f4ZHRVi4xS6HXQNhwlwc75B4zYBCXCsDWJOWS+ToGO1zOM+EBHC0fEmHOmyJ4zBE1qoIct8
 Xw/btTSnlBKjgukIphegymf5WOaq/uw+OQuqr+ge7bE96uSI5snP/uXs9Bdwy3hO8kIU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk0Vc-00Fuw4-7O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 10:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680691010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=;
 b=ccCG7nTXb1/1ej0Laf9Vh/R/4XTtROvhrW+TT0tyvb2ogDWHgnGy0ajOCN438/wTyqWxBu
 td/a7bL5Be0awf1Ss8AS/soY/mxmyh4zdByrGPNKgdjKJMFMAuyeLgxv8zHNtVbWUUmDbS
 XwidgRsjWrMlFl+5JhH5TTwzuY+Noko=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-2l1ArV34M6mOtgQZxJzddQ-1; Wed, 05 Apr 2023 06:36:48 -0400
X-MC-Unique: 2l1ArV34M6mOtgQZxJzddQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 d187-20020a3768c4000000b00746864b272cso16014134qkc.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 03:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680691008;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=;
 b=sGcAAIin7BSjgJHMp1oRanyxWsjqqscLv+KxE9Ehx2pAlcbKwz72r4swElXAV+VLIk
 IPvsO0cWvGYMivCQN4mFbuOAVaB1bsFdPAqbZPvT0jAppu1dBDm1JmGjeXYyaHKYnKP3
 yc/qqT/UJojC83hMzLw+Ohn+YZCsAhw7cpizBE6g53ZpNoMQmJrCTNPN0+ET1LyvXM2x
 sEhiWyvVykbCZGekszyU9blmGjZkiJPZWu2WjAguUty5k4kOO6fyKajKNCuR/mAQd14b
 12GgQPUZ2eeme12A/olpJTlHSQiwGg1PGTsVWGHCkKeD4H8kPtrBw1x2DAS2RD3eXuO+
 ee+w==
X-Gm-Message-State: AAQBX9fXVP93Flw9X/mYG/79TP7596gGLTJTEPUiH6ajPGC466v1/wia
 U+1PfCmaqGeBr/UVLx4doJVXfC8MK5FtdIMmMvg/3u6dXS+l/bHP9+zFmyjoLFG/tpO68dvUQY7
 qpeNjCQ2Ivn/5DRawOKkrs+6HQqEexk88AvRi
X-Received: by 2002:a05:622a:181c:b0:3da:aa9b:105a with SMTP id
 t28-20020a05622a181c00b003daaa9b105amr4016629qtc.17.1680691008082; 
 Wed, 05 Apr 2023 03:36:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yray4mqL/DA63FufP2W8G+Q2vCv/dEYqnAM/OkHjKwnv430c/AiUDk3FXiS3P6h8ilen17Eg==
X-Received: by 2002:a05:622a:181c:b0:3da:aa9b:105a with SMTP id
 t28-20020a05622a181c00b003daaa9b105amr4016592qtc.17.1680691007736; 
 Wed, 05 Apr 2023 03:36:47 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 i2-20020ac84882000000b003d5aae2182dsm3911845qtq.29.2023.04.05.03.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:36:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:36:42 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20230405103642.ykmgjgb7yi7htphf@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-6-aalbersh@redhat.com>
 <ZCxCnC2lM9N9qtCc@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZCxCnC2lM9N9qtCc@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Christoph, On Tue, Apr 04, 2023 at 08:30:36AM -0700,
 Christoph
 Hellwig wrote: > On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn
 wrote: > > Not the whole folio always need to be verified by fs-verity [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk0Vc-00Fuw4-7O
Subject: Re: [f2fs-dev] [PATCH v2 05/23] fsverity: make
 fsverity_verify_folio() accept folio's offset and size
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, cluster-devel@redhat.com, dchinner@redhat.com,
 rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Christoph,

On Tue, Apr 04, 2023 at 08:30:36AM -0700, Christoph Hellwig wrote:
> On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn wrote:
> > Not the whole folio always need to be verified by fs-verity (e.g.
> > with 1k blocks). Use passed folio's offset and size.
> 
> Why can't those callers just call fsverity_verify_blocks directly?
> 

They can. Calling _verify_folio with explicit offset; size appeared
more clear to me. But I'm ok with dropping this patch to have full
folio verify function.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
