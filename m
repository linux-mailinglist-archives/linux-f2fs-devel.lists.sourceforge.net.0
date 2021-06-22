Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F4C3B0B7E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jun 2021 19:35:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lvkIY-0003Bq-SK; Tue, 22 Jun 2021 17:34:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1lvkIW-0003Ba-Vz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 17:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nz/SNThAdkDvyEXXyYZh3jtio5ofsBWkkCRvgRhTXJI=; b=l+YiSNWxDsEvf5jmogctQuOFIs
 XGLwlhkbMzu2vOFH3ArRgYB2IhZoCYbFINhAZZNG7d/kHlxNS/Fmnedka8Em/nJnxsyXQ7e/HLRKt
 ONpb5tjKWW5qcriwtYKAnbRAyQP8fL/O0i5riEBkB44Rorjd9QCMXtiJmYlfhHl5WwmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nz/SNThAdkDvyEXXyYZh3jtio5ofsBWkkCRvgRhTXJI=; b=M3EIReMXxYPs46H2jQ/nj5lfnE
 JLbc7v6/54nU+ldx5hwwxWgUYJSSYljHrj3Lniof39LqU9vvVxvlYKP+2qArZuSeF1R9muWNN5fxm
 TX4sVCoNx7pNPgIr3Lr/u5TEHRNOXZXajWxeiYAqcoC+Oqtm6fG00qq84cOeSautH+yk=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lvkIU-007bsu-0p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Jun 2021 17:34:54 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 15MHYHST022711
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 13:34:17 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id ECCE915C3CD5; Tue, 22 Jun 2021 13:34:16 -0400 (EDT)
Date: Tue, 22 Jun 2021 13:34:16 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jan Kara <jack@suse.cz>
Message-ID: <YNIfGCLym51IYl6Y@mit.edu>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-5-jack@suse.cz>
 <20210617162240.GP158209@locust>
 <20210622095412.GD14261@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622095412.GD14261@quack2.suse.cz>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lvkIU-007bsu-0p
Subject: Re: [f2fs-dev] [PATCH 05/14] ext4: Convert to use
 mapping->invalidate_lock
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-cifs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-ext4@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Steve French <sfrench@samba.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sorry, forgot to send it out.

Acked-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
