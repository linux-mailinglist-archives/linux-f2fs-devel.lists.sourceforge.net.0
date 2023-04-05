Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8E6D7E9D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 16:05:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk3lh-00081c-LV;
	Wed, 05 Apr 2023 14:05:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1pk3lE-00081L-Hx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 14:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=net1/YQpLyeedtAUAtKmhMoSFz+7An5MzKe0V2cpLas=; b=TBw8gG7ZUjtlfTZY4uO5iqDSWk
 ibilBfjn8CvTDjlw8k5JUtuBI0y/BI/fAgTLP7fCLoahM1QJ49GFqEwZr0ItL8iSBiram0F7+eC38
 TiTSRUuxWb1LMW8UBewKlns1pRtFJ4/ycHwBRWzfCZgROhyq8KaHe2+fRbHJ1h2cTDwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=net1/YQpLyeedtAUAtKmhMoSFz+7An5MzKe0V2cpLas=; b=BYZy4G9lslV6SE18cF0hPW9eto
 MHHF1A45UgbZQRHz4iH27tDKnG8CGnsbW7kG+xPSXLyT6ac1ZNgiob6zCI7cDB9SKQ5cTWfQqJkWh
 yNrPPwdPN+3aROFDxvx0CcpCX/j3QN/e/swUnuJEYpxkqF9rVKEtl4YQu4oGYcQxCe2U=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk3l8-00G3B8-97 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 14:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680703501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=net1/YQpLyeedtAUAtKmhMoSFz+7An5MzKe0V2cpLas=;
 b=JGJeULaeMyhYtlq101XNuQtgSD0BWDFEGdbPJ/JTcn7w7MdJDA+EinvhafDj6wVG7T9sDF
 fFt2lagut/m/ZNFavnhls8dJf+NBUMoCI/6BKBNNkrGXu4GL2REayYV5bRFMoVUNCMGHy3
 lGbUduN9DDmP+dZflU2nhL1kvqUyP+c=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-ggUSKofwM7-z2cIBGskDYQ-1; Wed, 05 Apr 2023 10:02:12 -0400
X-MC-Unique: ggUSKofwM7-z2cIBGskDYQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 oa14-20020a17090b1bce00b0023d1b58d3baso11459697pjb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 07:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680703331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=net1/YQpLyeedtAUAtKmhMoSFz+7An5MzKe0V2cpLas=;
 b=LCRfabKbFSi/5YtunO4tFaozIsQ0M39cjCp0K/C74kC/uxJOTy3uiQ4r1wgG31EqMh
 RutT+yvJ4cfw8LZuvPTs1ePm+ti2ZQEwknBHrXy0YjDssCZB/jREx8ZD6yZCf56jp7Px
 1myW0O3XVSeiiuBriSCtInR/+mB9m6e5xHdfJZgJUDkrZvv/TZnuJLQEEGjnAWdCKr3E
 Vr7m0F5MKnu1u5LC5gFknZIaxCKyVFnzMc3z5+IxrYyWEYs8HbYFvAfpXPVbc5OO0GE2
 B2k8tDWZDLSCbMDlkbbz3WmNZrlLbrPigYMFb58JCOye4h4vDChG+E2TFmoSDt9itr9k
 cjGg==
X-Gm-Message-State: AAQBX9cLKBkdWAnGxMPpgaEyKNgaAZoKJQgXVrdIQXnmRIc8fRaMA7nL
 hVkAKpOQa7CNiH5pvUw3EshV4qn6vLEjVzIcZuDdDo8UqTQzNz8dwdOSgQrY2Kug+84d1cBhdWt
 raEQbrQwtF7I9C/cV1R3jZ7ILaOdJEqsNzPrfNg==
X-Received: by 2002:a17:903:283:b0:1a1:cd69:d301 with SMTP id
 j3-20020a170903028300b001a1cd69d301mr6292227plr.68.1680703330929; 
 Wed, 05 Apr 2023 07:02:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z3hrO2tDczikPPadND/siCWP3StMDF6ZwRfuQDU1LtW+SuQXatmasFWBRAsAV4qHbVdUEpFA==
X-Received: by 2002:a17:903:283:b0:1a1:cd69:d301 with SMTP id
 j3-20020a170903028300b001a1cd69d301mr6292202plr.68.1680703330583; 
 Wed, 05 Apr 2023 07:02:10 -0700 (PDT)
Received: from zlang-mailbox ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a630c18000000b005023496e339sm9037285pgl.63.2023.04.05.07.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 07:02:10 -0700 (PDT)
Date: Wed, 5 Apr 2023 22:02:02 +0800
From: Zorro Lang <zlang@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405140202.bdp3lzgross2cjbt@zlang-mailbox>
References: <20230404171411.699655-1-zlang@kernel.org>
 <20230404171411.699655-4-zlang@kernel.org>
 <20230404221653.GC1893@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230404221653.GC1893@sol.localdomain>
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
 Content preview:  On Tue, Apr 04, 2023 at 03:16:53PM -0700, Eric Biggers wrote:
 > Hi Zorro, > > On Wed, Apr 05, 2023 at 01:14:09AM +0800, Zorro Lang wrote:
 > > +FSVERITY > > +L: fsverity@lists.linux.dev > > +S: Support [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk3l8-00G3B8-97
Subject: Re: [f2fs-dev] [PATCH 3/5] fstests/MAINTAINERS: add supported
 mailing list
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
Cc: linux-cifs@vger.kernel.org, brauner@kernel.org, linux-ext4@vger.kernel.org,
 Zorro Lang <zlang@kernel.org>, djwong@kernel.org, amir73il@gmail.com,
 linux-nfs@vger.kernel.org, fstests@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, anand.jain@oracle.com, jack@suse.com,
 fdmanana@suse.com, ceph-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 03:16:53PM -0700, Eric Biggers wrote:
> Hi Zorro,
> 
> On Wed, Apr 05, 2023 at 01:14:09AM +0800, Zorro Lang wrote:
> > +FSVERITY
> > +L:	fsverity@lists.linux.dev
> > +S:	Supported
> > +F:	common/verity
> > +
> > +FSCRYPT
> > +L:      linux-fscrypt@vger.kernel.org
> > +S:	Supported
> > +F:	common/encrypt
> 
> Most of the encrypt and verity tests are in tests/generic/ and are in the
> 'encrypt' or 'verity' test groups.
> 
> These file patterns only pick up the common files, not the actual tests.
> 
> Have you considered adding a way to specify maintainers for a test group?
> Something like:
> 
>     G:      encrypt
> 
> and
> 
>     G:      verity

Good idea! Let's check if this patchset is acceptable by most of you,
then I'll think about how to add this feature later.

Thanks,
Zorro

> 
> - Eric
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
