Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0D617835
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Nov 2022 08:59:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqV7r-0008Aa-9w;
	Thu, 03 Nov 2022 07:58:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1oqV7p-0008AQ-Di
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 07:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UCGx+I//h802HOEchXeQ4l9Uif7TwqahE8c/QVCmorA=; b=akZ1HCV8kPChUs8ljAtqVQFg8+
 uFhljpHFzBQXkxlP0qmf7XiESfYC5eURaTMwv/L0d4Pkf3iU+knHMFEbKOxqnVbSpe1a2pKbBCbC0
 hR0LLyldz2OPfO2e7W6xaMGOxRVQvz50T57S1Lqw7i101zdxeclGask2/EhrEflxAHoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UCGx+I//h802HOEchXeQ4l9Uif7TwqahE8c/QVCmorA=; b=bGyGGTiZkwqqq6NzPtUlv6Kszx
 iHPCQtlLGoeZWP9MALX6XOsP0vq7mzJ0tN1sl0HVOsDnNWKJ43mZy1j6poT9LdH8Adpu4Kinf6liR
 E/ZGAO5xFQuy7z+Q/La1HfJWraFXOCI2AhHy9i/Ms+rR2yLirUuhjrJhIvMoXDbXwgY4=;
Received: from mail-qv1-f44.google.com ([209.85.219.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqV7o-0007Vw-O0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 07:58:57 +0000
Received: by mail-qv1-f44.google.com with SMTP id n18so612757qvt.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Nov 2022 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UCGx+I//h802HOEchXeQ4l9Uif7TwqahE8c/QVCmorA=;
 b=Qo0pCYgx3Qq1H7gtsjTo9ahtaWGAPbAqpUUP7w83R+hioFcvnb/Vum4t6njrIqmCbQ
 9oglIFHFznb8HWDOhJ8VqGBZno5DvMa/i9rWqzvIS3F1Qe6lSOVMpDruWh58G2ZJDVRR
 +irGuRxsC3szEMLHnbBdSVWy+8gAtIi3/dsdlKShS4dWGsFcwevGYm9bbQNs76cqEy+l
 a7aTzEEQgFxLLhP1XqsxI1o93xRoLeyOkLszg3jyihUg4tqsI4qRKCp463KDJruVxcER
 uahSco4O56I/ia+N+pdnGxKbS5y4Jn6JIOipSvnU+FLMXl5F+IFO/pgiKOzrTt8rdoYE
 jcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCGx+I//h802HOEchXeQ4l9Uif7TwqahE8c/QVCmorA=;
 b=NV8KZ0CgInJmpIDeDcfMWokeFdHgbk7v7QGeD4PQqU4d0HjaeaNTtUDKcDA1HzDNAF
 Hok+hFara+7NkITWnmq5bBCN9BWfNjQXUTAH62EtSC3hnU5RIWsBXqEKuYsabiu9k3Az
 LTtrrbjC+EnUB8/LM7gykMiZH95CglYOzUqpW7Bv/E3iLZVvvw0YVjBDhCk2mRbMbOYh
 9EIYyVQXJ/21gBDBPV57Hvg/F2VRvLaLeF3+4WJujjLhN+u6m7EwiHDFgYZDnEfDc/WC
 Vew1DOKLlLsiOs0ebeBDcALUZo7/gmHr5RJppzCH6aXC96HI9TzpbWyGDRzvkygADyZG
 8sxA==
X-Gm-Message-State: ACrzQf3JQr8TnmmprD7DeADW3Zz2tRmz7t2uakVYT+6k3z54pgMipCpO
 xdOFj8H6z423shV0f085afayxSYc8iDsuQ==
X-Google-Smtp-Source: AMsMyM7EbTGuTativfwuYw+G5QrvaMpsSoYHAtMTN9boWfI/C7HSKjfDJIybcNCOqaRH/jY3hHhBSg==
X-Received: by 2002:a17:902:ed8e:b0:187:1c78:80c2 with SMTP id
 e14-20020a170902ed8e00b001871c7880c2mr21606400plj.38.1667459292279; 
 Thu, 03 Nov 2022 00:08:12 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au.
 [49.181.106.210]) by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b00179e1f08634sm9438901plp.222.2022.11.03.00.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 00:08:11 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oqUKd-009gYz-VX; Thu, 03 Nov 2022 18:08:08 +1100
Date: Thu, 3 Nov 2022 18:08:07 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20221103070807.GX2703033@dread.disaster.area>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 02, 2022 at 09:10:08AM -0700,
 Vishal Moola (Oracle)
 wrote: > This patch series replaces find_get_pages_range_tag() with >
 filemap_get_folios_tag().
 This also allows the removal of multiple [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.44 listed in wl.mailspike.net]
X-Headers-End: 1oqV7o-0007Vw-O0
Subject: Re: [f2fs-dev] [PATCH v4 00/23] Convert to filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 02, 2022 at 09:10:08AM -0700, Vishal Moola (Oracle) wrote:
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
> 
> F2fs and Ceph have quite a lot of work to be done regarding folios, so
> for now those patches only have the changes necessary for the removal of
> find_get_pages_range_tag(), and only support folios of size 1 (which is
> all they use right now anyways).
> 
> I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> beneficial. The page-writeback and filemap changes implicitly work. Testing
> and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.

Same question as last time: have you tested this with multipage
folios enabled? If you haven't tested XFS, then I'm guessing the
answer is no, and you haven't fixed the bug I pointed out in
the write_cache_pages() implementation....

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
