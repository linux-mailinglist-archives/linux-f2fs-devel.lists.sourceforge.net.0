Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D871618F1F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Nov 2022 04:37:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqnWO-00065M-VN;
	Fri, 04 Nov 2022 03:37:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1oqnW9-000658-AG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 03:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kCztCif6DGnUVPea69d1j6HBte1tInJ//NGbT2adCtA=; b=QhXx+Ok9nQeadwejoyJllrzFPV
 O+j0MSYgjQPpDaLchB3/uyUif36dH10PYWCIg6ypgySM8Jpr1hkfLbHL4DKtdu9PYXd93dAqvfiIP
 WNFkK9K6e1GPa6rPp06/waRIERK7qpvRP/C9TDx1nL0vHXIXhrZDAZNkZFIvj5HlipPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kCztCif6DGnUVPea69d1j6HBte1tInJ//NGbT2adCtA=; b=ip0/zPOyXCVsdpkwrl75kL1dts
 N4M4uju19U/0FaMaO08AhLTBKJ82qPk86Sro4b5vT1v98ydgxJFGatWgbeIvjSDegCZ8wmzJKZ3dn
 G21tum2skrTwoMpoL7+Rz6QwkChK7JDCm8mXk4g9JsGwnfdyoRu0wgIP0QiW3BOVYu6E=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqnW0-00BHCo-SZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 03:37:17 +0000
Received: by mail-pg1-f169.google.com with SMTP id f63so3373061pgc.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Nov 2022 20:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kCztCif6DGnUVPea69d1j6HBte1tInJ//NGbT2adCtA=;
 b=uj2thbHtG/d+GBBCufhO7rN+QkuEm7zsR1utnZpf1jQ6jQI6apkQTpUS2wcEmA9aNC
 VnDMe2rmlwjjtPUJR6RVdf+UJIK/YCtwiDAFrNIV7Nt++fXhl9nREiFkHf0RyMEPfvfO
 onGWmNN1ovJwkvkYC6fzzHZz7zyvVev9H3OguSEusghpv0YPPtdfeKpV8TCgCnMYqtfc
 Ksic71C8032fBMagPD7RLDMZgSbzkcCWA6HBFsZEVIK8PskhHmcNukEVkFYsBkmvmeoC
 g/qCQdT1fcwEOyEG1ZYfH8GugnyK0CKLKk6hzKwIFkwwhNd+ojc6bS3gdGaV6YzySSoe
 prLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCztCif6DGnUVPea69d1j6HBte1tInJ//NGbT2adCtA=;
 b=Hs8JDkO9ckJgzKb0x09qVk8t/xtGpHtLV3+xS4RgMg7QAAnD7sGlBEyNvaSp64wC9C
 tEZS5qfJqDZLdhsFC+rZJ5XiD5XZISRG3w2MQMLx2rfE04NmhZFpkRN6pQ0m0OhHptZD
 DA8OMuVKLS7zyCL9GiObbEJ1JH7ut5yk6rMuvNgGnjXwCT5RfM6AE/PbsGn+kLI22T7b
 FVaO+u5IheHfpOzzW8CBPAFzrxPk0l+F5HHtqDWXhFZOtSATqLa5qm6mb9uNuF6Pk0Ef
 xMOy4417bzXw7+aBq/ozCkNxVDwvauo8BdlixDMtjmKtlTCNHPYhpvuuiMN/h2JeBkj1
 OvjA==
X-Gm-Message-State: ACrzQf3fB2QF6bKd6tk7JIsRFlnNJ30PGwcJNyOZ5BzJH4xR+RxUYDWm
 sMhCL/qmAYdncqmeeHZzjArF0g==
X-Google-Smtp-Source: AMsMyM7NwhgMGw/Ejg/10+QrYuOi1WfTIe60hww1ZNfzsfJwCZnIyT2jB8JwYZIzMahLdSnJ6wzgKQ==
X-Received: by 2002:a05:6a00:2396:b0:56c:b770:eda6 with SMTP id
 f22-20020a056a00239600b0056cb770eda6mr33239633pfc.38.1667533023291; 
 Thu, 03 Nov 2022 20:37:03 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au.
 [49.181.106.210]) by smtp.gmail.com with ESMTPSA id
 x13-20020a170902a38d00b001830ed575c3sm1430190pla.117.2022.11.03.20.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:37:02 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oqnVr-00A1XB-Bm; Fri, 04 Nov 2022 14:36:59 +1100
Date: Fri, 4 Nov 2022 14:36:59 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20221104033659.GA2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
 <Y2RAdUtJrOJmYU4L@fedora>
 <20221104003235.GZ2703033@dread.disaster.area>
 <Y2R8rRr0ZdrlT32m@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2R8rRr0ZdrlT32m@magnolia>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 03, 2022 at 07:45:01PM -0700, Darrick J. Wong
 wrote: > On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote: > >
 On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote: > > > [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqnW0-00BHCo-SZ
Subject: Re: [f2fs-dev] [PATCH 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Vishal Moola <vishal.moola@gmail.com>,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 03, 2022 at 07:45:01PM -0700, Darrick J. Wong wrote:
> On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote:
> > On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote:
> > > On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> > > > On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > > > > -			BUG_ON(PageWriteback(page));
> > > > > -			if (!clear_page_dirty_for_io(page))
> > > > > +			BUG_ON(folio_test_writeback(folio));
> > > > > +			if (!folio_clear_dirty_for_io(folio))
> > > > >  				goto continue_unlock;
> > > > >  
> > > > >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > > > > -			error = (*writepage)(page, wbc, data);
> > > > > +			error = writepage(&folio->page, wbc, data);
> > > > 
> > > > Yet, IIUC, this treats all folios as if they are single page folios.
> > > > i.e. it passes the head page of a multi-page folio to a callback
> > > > that will treat it as a single PAGE_SIZE page, because that's all
> > > > the writepage callbacks are currently expected to be passed...
> > > > 
> > > > So won't this break writeback of dirty multipage folios?
> > > 
> > > Yes, it appears it would. But it wouldn't because its already 'broken'.
> > 
> > It is? Then why isn't XFS broken on existing kernels? Oh, we don't
> > know because it hasn't been tested?
> > 
> > Seriously - if this really is broken, and this patchset further
> > propagating the brokeness, then somebody needs to explain to me why
> > this is not corrupting data in XFS.
> 
> It looks like iomap_do_writepage finds the folio size correctly
> 
> 	end_pos = folio_pos(folio) + folio_size(folio);
> 
> and iomap_writpage_map will map out the correct number of blocks
> 
> 	unsigned nblocks = i_blocks_per_folio(inode, folio);
> 
> 	for (i = 0; i < nblocks && pos < end_pos; i++, pos += len) {
> 
> right?

Yup, that's how I read it, too.

But my recent experience with folios involved being repeatedly
burnt by edge case corruptions due to multipage folios showing up
when and where I least expected them.

Hence doing a 1:1 conversion of page based code to folio based code
and just assuming large folios will work without any testing seems
akin to playing russian roulette with loose cannons that have been
doused with napalm and then set on fire by an air-dropped barrel
bomb...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
