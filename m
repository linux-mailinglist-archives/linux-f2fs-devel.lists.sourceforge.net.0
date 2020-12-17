Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1732DDA51
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 21:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b/0l+1iIDPdJwMMl1jigxBLHoyE7NdN2bmiGf1uuqj8=; b=GCq2HGZKZMWJcaFD1xHD0xodQ
	GmIMRbqDTIXv6GE+zM4Wbvldq9dRZVakgYC76W0qUL3tH28O1Q24AZMsNBqBBoKD4lz4Wwax9+Ia7
	BYB/S+SLjGG6N9kGBLiIDIo/97t2NTTf5f1ktVLOtCEm6BwfEV9p7p8A/6+TpRIlQXV9o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kq0FH-0003dJ-1R; Thu, 17 Dec 2020 20:51:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kq0FF-0003dA-03
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 20:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nH4vnOfqXUS7gwxv1RANkNTAFbgtr06PbQXxBVDkxQU=; b=UwyFPnNQdzX3v25CWLu//DADZv
 Ch4dmyVOUJOqwHFWHO7DLIZUDHt1Hu4aVh6XoPxp99HhdoZ8VxNbwsZa4wCo0ROxscUxmNBMCEukH
 H2LV3DV982IzLEu4XbLYZR4NAFahieZ7CJoHy18j41VMwDicTMVhFo1h1xrAfUNJXy+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nH4vnOfqXUS7gwxv1RANkNTAFbgtr06PbQXxBVDkxQU=; b=imd9cRiw1VTpUBVM3iOpUTbr2g
 WQZFDMnRSIULIinqsKL9iPkksVFbw9y72tPemsEKUhSIyasvlDNux/oFh3WNMMMSIJKHYOez7VnjG
 /89t74s9y0QzY5dgMJXnNCd9XEgXID5oWNahAhkGeVAOdGVHvYftmWt5KcgOgBfhz/xw=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kq0FB-000b3v-7t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 20:51:28 +0000
Received: by mail-pj1-f50.google.com with SMTP id f14so75255pju.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 12:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nH4vnOfqXUS7gwxv1RANkNTAFbgtr06PbQXxBVDkxQU=;
 b=o2D5JCXv7JshlKHecTF945qen6oARQ9FYv6oQjNeC+GDmUbCBZLkeoY7HIyyUSP4D8
 47XcwEJmcP0sXIkHhCHUkLZt3ObIdMh3X04ZhRV85l5u6BvJ6U2gUrKcMHWVMNX7+k1S
 F62oR7+AyBi417VuTWxe9rS8bWBl0dJLkEwaIugVXbxjHG7jurwCFQ2sgmLKq9hxwaib
 DCzS2M7d/bcDgLC0vCHJlZch6Aj4VrwMnnOofRCoCs7sMKeCpH1PNMTWO8Gnp+494iLw
 9JymtqZvMU+2h8NXkV/rKA1KAow9rMBuUwebk6ELVrVZg//YO6z9sF7r7nUaw3nVei6V
 Ng4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nH4vnOfqXUS7gwxv1RANkNTAFbgtr06PbQXxBVDkxQU=;
 b=PW0A5oW43MTDPJhjqiW8YC1oEJA+feVgRMCK/bQZGeGXlO5dzuTJhJLkTTgxuDif4D
 fWdZFTzDu8u0bwT2TgaquUY6Z9Ys4pgN9FxD8fFFGQiO62KTjIx2Pu2cZjH8FLZgG1T0
 ckSc9mlh2JgjfWAYGBeGVzE6kcZDPTTpFbEowz8HsiESdRmuoFP/516qwE0aL8YNeORF
 2oMKCAwGVgPgQrKy8L1hRUpjsFwhn4WU3wa3QDn6pHK88S9Z2PpveOqNlvSntNw66J5e
 FAaW1I7mZS0DOWRH0jHV5eZiPuLMt7XBypn4bJM9lVCcJTXzK3XJSJVKhe4/VVnBBHEu
 CSvw==
X-Gm-Message-State: AOAM5329sk1fYAUwK5zZzLmJJPwfBUWlxm+q6l0pDunHzrFQDQ6baW0Y
 qOBVQiu4DEZzrpX5XNPfQGSUbQ==
X-Google-Smtp-Source: ABdhPJxZL/yVwax1xI84IxNTqxuO6lSubHgIxsTLLS+VrdJjZ7NJ8YCkRuXgWSgbji6o/23F/9fmCA==
X-Received: by 2002:a17:902:a3ca:b029:da:df3c:91c8 with SMTP id
 q10-20020a170902a3cab02900dadf3c91c8mr1091233plb.41.1608238279445; 
 Thu, 17 Dec 2020 12:51:19 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id y15sm5525255pju.13.2020.12.17.12.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 12:51:18 -0800 (PST)
Date: Thu, 17 Dec 2020 20:51:14 +0000
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <X9vEwgHlURxvxqiM@google.com>
References: <20201217150435.1505269-1-satyat@google.com>
 <X9uesUH1oetyyoA0@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9uesUH1oetyyoA0@mit.edu>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
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
X-Headers-End: 1kq0FB-000b3v-7t
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

On Thu, Dec 17, 2020 at 01:08:49PM -0500, Theodore Y. Ts'o wrote:
> On Thu, Dec 17, 2020 at 03:04:32PM +0000, Satya Tangirala wrote:
> > This patch series adds support for metadata encryption to F2FS using
> > blk-crypto.
> 
> Is there a companion patch series needed so that f2fstools can
> check/repair a file system with metadata encryption enabled?
> 
> 	       	    	   	- Ted
Yes! It's at
https://lore.kernel.org/linux-f2fs-devel/20201217151013.1513045-1-satyat@google.com/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
