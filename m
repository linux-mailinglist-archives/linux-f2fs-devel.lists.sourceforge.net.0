Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 023046D82DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 18:04:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5ce-0006YF-6h;
	Wed, 05 Apr 2023 16:04:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pk5cc-0006Y9-Qc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=; b=bmkcsnAJdQ4W2OnCI5/IRgH56d
 7h+hABCS3SM/M8YFa8lGEm4POOdTjI+KAhnS9BZytF6jzAhYaPBFcNs4JhWop79ftjMGqBawjGnhD
 uiYCFJC0kx6C1oC1CPaY1C45hrzYofomF+9oFxSdfURgfsoQK6Wht3FE7XxDoXLYCBa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=; b=Jd+mJJMTn3j7COoYNxqwelhOuE
 K/rmGq9Qp55FTcQSM/erYfsfSwo4hMYez5wmABTAw18xYtS30Oe07Fy8EZe/L+Ir27BPmbA/sn8qF
 39BEQ5lfKuiK3p2FtZlkU6zeUmNWtwl/hRIBxWfHxzy89zGuwOesEfeIy5iL17ZmSTso=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk5cZ-0002DG-K6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680710661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=;
 b=WZQDHh+of/UYNZ2stDGY9PzROsTjfchHFxGKS5F1+FlDvGBU9IXS5pBpRk9ozdWxSlwwmX
 TteqVqcNE+f5rCMnquCTtvjXuolTGWtyMInBbiCBByk28kx9bAYWk9WMffQrfKlrz5FJyn
 RKiBK6G2l+U0Sen6jfOFJRi15JdcUs8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-TFt4Y9AeMjG9duoZLjyhnw-1; Wed, 05 Apr 2023 12:04:20 -0400
X-MC-Unique: TFt4Y9AeMjG9duoZLjyhnw-1
Received: by mail-qt1-f198.google.com with SMTP id
 v10-20020a05622a130a00b003e4ee70e001so18460672qtk.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 09:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=;
 b=mKGYvfZa9IJi9gOxd2fcfPgXChJnOSgB9fT498SBcZlrdqdxh9G4lqUJMVzjtE9NKy
 b6Ld4HgN4ai0q4TmAAEn5RXX75+A/4BXPX13BOlqWGoNwIxCmKOo4ZUYkBHCPuuXw35I
 hGvSLOs0tugDRsGymJsmcCHhj1ArtwoZ60ZHuZUiTVStHdSUKZheRReWY4mFD1zRhqVt
 CIopLJfftNVM7YspJIbcebm4meAUa42cSgSjsRpcTdX5nIB5HNT60F7GId0E+5/g+0Q5
 MFzXRunCjWtIiO2NXaZCIJKAOmq+T3lZIQkA/mn9fJeS+56ybJp7XPb7Eh5ReSjmVMxA
 Q2jw==
X-Gm-Message-State: AAQBX9cLZGX3PHScfy9MTsg9X6rXuPfjCMiyCX+sYFuePTjB8sGgK0nc
 Ngm8LvAJbJzGk5KHJaJuB7XRIXA9EOkDsLLBg5mcTQqXw7pz4Q26T/H1Yx8U2KGDTSkf1XB5aEb
 TWn8d2QuFqkt5Kp3PpG3zhkfBbIeF0/bb7efN
X-Received: by 2002:a05:622a:4b:b0:3d8:8d4b:c7cc with SMTP id
 y11-20020a05622a004b00b003d88d4bc7ccmr7038051qtw.46.1680710659556; 
 Wed, 05 Apr 2023 09:04:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350a5lKksulKGDz1s6x8IlpR6R6JUlCw8aCDbcTRwKrjAxeI/G0vqKKfr43MPgy1YnBz9zPAfFA==
X-Received: by 2002:a05:622a:4b:b0:3d8:8d4b:c7cc with SMTP id
 y11-20020a05622a004b00b003d88d4bc7ccmr7037982qtw.46.1680710659193; 
 Wed, 05 Apr 2023 09:04:19 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac84f09000000b003e398d00fabsm4083588qte.85.2023.04.05.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:04:18 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:04:13 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405160413.7o7tljszm56e73a6@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404233713.GF1893@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230404233713.GF1893@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 04:37:13PM -0700, Eric Biggers wrote:
 > On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote: > >
 The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k, [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk5cZ-0002DG-K6
Subject: Re: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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
 hch@infradead.org, cluster-devel@redhat.com, dchinner@redhat.com,
 rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 04:37:13PM -0700, Eric Biggers wrote:
> On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> > The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> > xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.
> 
> Just to double check, did you verify that the tests in the "verity" group are
> running, and were not skipped?

Yes, the linked xfstests in cover-letter has patch enabling xfs
(xfsprogs also needed).
> 
> - Eric
> 

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
