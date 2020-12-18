Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F02DDC40
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 01:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GYI2hEsQH7RZUuZKCEcYyrMqjEdkewnQ2Yw6ovQcDfE=; b=FxtJiXODHSdlU/nWHpbDt5EIk
	7/9qz43751pow0Thssvx9kUuIp0C1Epi9B6O5GG9QkkOG2fTo3m6zV6u6uG2JPC7mwB9Q+aecJNf+
	uoGjnWJ862S4WUdmSEoYJ4HVTPjUWopQRQ78EnNcArPoOwB+4fJhjzRZns1HoTmJQIM70=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kq3H3-00056U-K5; Fri, 18 Dec 2020 00:05:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kq3H2-00056N-EY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 00:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ftImLJzo43H5xhmSmjP4UoiWeHjvqDggI/0+orDetik=; b=H9TuHuSBR1jqFMAhlXlP3JuOPd
 68ih13J+Cd0RUz/BJg6jEA9hvY8oFr485lAjI7wuEnagP34r3kBQ4tSfHoUDP49gyczzFmDPJN3p7
 maMr3BwzNhbvoM/Ezs/Eq4Z1sGdkdCXRNc/Fg/VuXQO6AA6Q5R0c2bRZbC3aKKbj48O0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ftImLJzo43H5xhmSmjP4UoiWeHjvqDggI/0+orDetik=; b=Q9L+YMqP1XXU7lFVb1miwysOx1
 6AZ/cYCBuuown8YFCRHuUVOxQVKgDCuTToDTRvixicMGWgFomwnaGx0G9ryptV3Pzg7FPS/wxIA/w
 YNATTyiUMmgj4zcR8l9NFMub5mLQqgEokodaq4orUcjv3bLSM63BeqHMztbEZvkpLER8=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kq3Go-000fEm-4W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 00:05:32 +0000
Received: by mail-pf1-f181.google.com with SMTP id 11so432504pfu.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 16:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ftImLJzo43H5xhmSmjP4UoiWeHjvqDggI/0+orDetik=;
 b=lGUzz2DBxHqOZ3lDtOCCkd5RBICJjSiF7pJd7d7sVRkhLLTKqKGLKsCCQh83Y2DyRu
 R3Hp/kZrLyaW6w9dqBBrAVhEv3IN66sHWz9c/Bfw+5Z8wcu4NHMGbwIqL+wk5UMRsv4G
 I27gqRa/r18pf7SWXr6cl8quCCTDDBFrv6Y9/i2tGMl+BIJAT2A5z59eEJPIudq5dYWA
 IJgcSLsecYIDeumR/5soBqp8zY0vIS+8EjXWq+Macuep/4LhIjKbn9IPWV/0KIs+bLje
 4owXXvYNfFeizvCslb0wzsQlVgTwd3w8j2YI5Ya+v8nrsLjuDr2+4wZOAS2RB1GGddcr
 ABkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ftImLJzo43H5xhmSmjP4UoiWeHjvqDggI/0+orDetik=;
 b=apI+Q/OHNjPb2oEUSDt06NT+xpeexjg4HYNHid/zkAs5zcdvSU7Rk2lik5u6h4aDZO
 /RU7ZU3OUXEZfI6kLv8wof4Y9kmITn/oLVsx2CYywJbdMu1o8ofijmwp+Gd0+6zexNl3
 Tanz70OlpTF1uuqKHkJE7JU1rE36iNWNLckJkLKx1HwmC18TRjaUxJI2ZQSvZ9z4ud1R
 wrsykmW0QjX+m0NRvuhpU5pnzPQiGRp/1UYPhmNNMD4kxPbdhdhkvXqyCX9oV+/gzHw1
 Efvv+CRaOtSg8Ur+ZsnUZcjVLRKuPF9lw6Ux+gNeet8jXEi6B3wy/W+f8nzxDk0SnRx8
 peZw==
X-Gm-Message-State: AOAM530gbjBg6+vociwbvzhbyHeAXeTovTeAH0y40D+vTXYWuOQ5hSrp
 nD5Y2YTLw8MOBUP6nGmehqThjg==
X-Google-Smtp-Source: ABdhPJy7HG5nAm/M1+v6tcuBGzjRBKasXQMAtPvNHhZ0NDa8zYyozbj7OZjyp+1R37ig9gxk7wnJ8g==
X-Received: by 2002:a62:ac09:0:b029:1a9:dd65:2f46 with SMTP id
 v9-20020a62ac090000b02901a9dd652f46mr1674893pfe.15.1608249912162; 
 Thu, 17 Dec 2020 16:05:12 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id 14sm4578052pfi.131.2020.12.17.16.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 16:05:11 -0800 (PST)
Date: Fri, 18 Dec 2020 00:05:07 +0000
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <X9vyM0jb91Q7aBJW@google.com>
References: <20201217150435.1505269-1-satyat@google.com>
 <X9uesUH1oetyyoA0@mit.edu> <X9vEwgHlURxvxqiM@google.com>
 <X9vrA/h8et4japdI@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9vrA/h8et4japdI@mit.edu>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kq3Go-000fEm-4W
Subject: Re: [f2fs-dev] [PATCH v2 0/3] add support for metadata encryption
 to F2FS
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 17, 2020 at 06:34:27PM -0500, Theodore Y. Ts'o wrote:
> On Thu, Dec 17, 2020 at 08:51:14PM +0000, Satya Tangirala wrote:
> > On Thu, Dec 17, 2020 at 01:08:49PM -0500, Theodore Y. Ts'o wrote:
> > > On Thu, Dec 17, 2020 at 03:04:32PM +0000, Satya Tangirala wrote:
> > > > This patch series adds support for metadata encryption to F2FS using
> > > > blk-crypto.
> > > 
> > > Is there a companion patch series needed so that f2fstools can
> > > check/repair a file system with metadata encryption enabled?
> > > 
> > > 	       	    	   	- Ted
> > Yes! It's at
> > https://lore.kernel.org/linux-f2fs-devel/20201217151013.1513045-1-satyat@google.com/
> 
> Cool, I've been meaning to update f2fs-tools in Debian, and including
> these patches will allow us to generate {kvm,gce,android}-xfstests
> images with this support.  I'm hoping to get to it sometime betweeen
> Christmas and New Year's.
> 
> I guess there will need to be some additional work needed to create
> the f2fs image with a fixed keys for a particular file system in
> xfstests-bld, and then mounting and checking said image with the
> appropriatre keys as well.   Is that something you've put together?
> 
I did put something together that sets up metadata encryption on the disks
used by kvm-xfstests. The main code changes were to add a fixed
metadata encryption key with keyctl, and export MKFS_OPTIONS with the
metadata encryption options.

The mkfs options are the only options that need direct modification because
the rest of the tools (fsck/dump etc.) automatically do the right thing if
the FS superblock has the metadata encryption options. But the rest of the
tools do need the metadata encryption key to be present, and some
xfstests/other parts of the harness code clear the keyrings directly, so I
had a few more hacky changes to re-add the keys when they're cleared.
Some more hacky changes were needed because some xfstests override
MKFS_OPTIONS. I'll be happy to send what I have to you/put it up somewhere.
I'll also try to clean up the code a little, but my knowledge of xfstests
is definitely limited so it might take a little while.
> Cheers,
> 
> 						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
