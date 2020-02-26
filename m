Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE61705B6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 18:13:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j70F2-00026J-RN; Wed, 26 Feb 2020 17:13:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1j70F1-000262-5S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 17:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iw1oHBmXUdp5IIisAtDC6XniuQU/lJXPuIIsSzlu6CA=; b=eycOCMz5GPWKGcV0tWu81F567J
 wyfH3tXs4RXr0w47vUXYDWyvVkd/h+BRgxmrksQhIYji6ccRH+yc7OcD415CaKUpqnaHsgixID28p
 +lzlCTZjlPK5vtgZD38Cu9g7PcLSgbpD9CmUG5YuE1QGOyvOYJCWqP5jcXoBlGdZd/uc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iw1oHBmXUdp5IIisAtDC6XniuQU/lJXPuIIsSzlu6CA=; b=hfk14RhYnPMyPXAaqCyZteR4A7
 sCpaY8sanur2NYJWM2TZz3Uwftly9UZ11bnVF+wSrtUKBf6pNXiWh41JhEM5PvwTtEj1MlURIrBIP
 UZlWXNeT7sL8MwDF+Y1uZ/457zuTjE6j0lc+mbtWoiT+F+Of20QXdvXGXG3f+mmclDk4=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j70Ey-00AR2O-Rh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 17:12:59 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01QHCatj193451;
 Wed, 26 Feb 2020 17:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=iw1oHBmXUdp5IIisAtDC6XniuQU/lJXPuIIsSzlu6CA=;
 b=AB69FvJ690epl2q3iEF9OAd01yCyTXgZ/0nRUe4hTTW1dVmeZsSnnrLlfl8WVjuet02R
 UvAohP4OexZPftYUUJFg0zP/4Ky/r1sIFhKYF18D6BOTL+4Fb8rbm0i+y3AK6usAQr7u
 9h0s6M1CJXYX7Gp8hZQVpVN5M+me+IhAGpuaVGJuseVKH2jSSWUxSZ2Pd9C3Wv8pPDWp
 NRLpae6sc2A1ll0fpZ2zQUeA43UmK9FEQWt1khRLfEV2Yeh3TOU5jJbkhIp/RGeQ7E3M
 ZxKg/iMXZIht/FzuXlYpXD41afPl/KsVkFMoj5MtROezpGcDt6M2eN19sEiew9VczPQI 4w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2ydct353mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 17:12:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01QGmHuR157882;
 Wed, 26 Feb 2020 17:10:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2ydcs5j8nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 17:10:39 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QHAdYU126581;
 Wed, 26 Feb 2020 17:10:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2ydcs5j8me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 17:10:39 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01QHAcnt030079;
 Wed, 26 Feb 2020 17:10:38 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 26 Feb 2020 09:10:38 -0800
Date: Wed, 26 Feb 2020 09:10:36 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200226171036.GE8045@magnolia>
References: <20200225214838.30017-1-willy@infradead.org>
 <20200225214838.30017-26-willy@infradead.org>
 <20200226170425.GD8045@magnolia>
 <20200226170728.GD22837@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226170728.GD22837@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9543
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002260114
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j70Ey-00AR2O-Rh
Subject: Re: [f2fs-dev] [PATCH v8 25/25] iomap: Convert from readpages to
 readahead
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 26, 2020 at 09:07:28AM -0800, Christoph Hellwig wrote:
> On Wed, Feb 26, 2020 at 09:04:25AM -0800, Darrick J. Wong wrote:
> > > @@ -456,15 +435,8 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
> > >  			unlock_page(ctx.cur_page);
> > >  		put_page(ctx.cur_page);
> > >  	}
> > > -
> > > -	/*
> > > -	 * Check that we didn't lose a page due to the arcance calling
> > > -	 * conventions..
> > > -	 */
> > > -	WARN_ON_ONCE(!ret && !list_empty(ctx.pages));
> > > -	return ret;
> > 
> > After all the discussion about "if we still have ctx.cur_page we should
> > just stop" in v7, I'm surprised that this patch now doesn't say much of
> > anything, not even a WARN_ON()?
> 
> The code quoted above puts the cur_page reference.  By dropping the
> odd refactoring patch there is no need to check for cur_page being
> left as a special condition as that still is the normal loop exit
> state and properly handled, just as in the original iomap code.

DOH.  Yes, yes it does.  Thanks for pointing that out. :)

/me hands himself another cup of coffee,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
