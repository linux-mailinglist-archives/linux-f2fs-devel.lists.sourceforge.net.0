Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 652ED9A6711
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 13:53:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2qyQ-0006oj-5m;
	Mon, 21 Oct 2024 11:53:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mpatocka@redhat.com>) id 1t2qyO-0006k1-1k
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 11:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SNCQhHzFd1NUHzGxH9c1VqwwdqX/nhUWNke4YanTciI=; b=FUe/y6OwGtG54AacRyH5dKJdOF
 m6v4SHz7WyRPdIft1/5GJf3L5izIbMbTguc7GbqxxtizZ9TcNpX26A06fVdQGX7FbRyVUfQ9/YqDe
 ktbpyzx8E7KMkYK1Jvsac0Pli3hyRhIVMWEFbNuH7iYisCZFuSC05WCOM9SzgKfRt1Os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SNCQhHzFd1NUHzGxH9c1VqwwdqX/nhUWNke4YanTciI=; b=GFJZyPb0M7+JXu+dDra/MW+CT9
 Ui7CoR3V0ZiGmhZiLsVVEgGaV3FHLru0jBNUzx8nlycBIwmaZ3FczvqbDZLdC/jP2Px2/Vs+cvpEv
 P7iq2EsgvcdM7WP0Jpw+aJ8Fm2wpr0JNJmhEhJg+KHMJ7Zu4M7kQw++I+6MK8ghBVw48=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2qyO-00059Z-1C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 11:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729511593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SNCQhHzFd1NUHzGxH9c1VqwwdqX/nhUWNke4YanTciI=;
 b=ATio6u2UoW59Oec0TPKpOuak4ElGONBOV8KKVsNSgYCvUMNGqfU/BAxFYIc4XdwOCP3gt2
 5P+lPaSRqe8x1SBlMZTxdHGVJgeR+fixpKNL+aB+Yzxfit6AUH3HDIEV/RH6qCwyUCFpwX
 xwBXifDz41mDNoE6E0l47U9T+fyxc/A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-YKvOEUpcMDKgFALrgs2VdQ-1; Mon,
 21 Oct 2024 07:53:08 -0400
X-MC-Unique: YKvOEUpcMDKgFALrgs2VdQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 42C7619560AF; Mon, 21 Oct 2024 11:53:06 +0000 (UTC)
Received: from [10.45.226.64] (unknown [10.45.226.64])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1339E1956052; Mon, 21 Oct 2024 11:53:02 +0000 (UTC)
Date: Mon, 21 Oct 2024 13:52:58 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20241018184339.66601-1-ebiggers@kernel.org>
Message-ID: <b56689c6-c0cd-c44e-16fb-8a73c460aa87@redhat.com>
References: <20241018184339.66601-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 18 Oct 2024, Eric Biggers wrote: > This series adds
 "metadata encryption" support to ext4 and f2fs via a > new device-mapper
 target dm-default-key. dm-default-key encrypts all > data on a block device
 that isn't already encrypted by [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t2qyO-00059Z-1C
Subject: Re: [f2fs-dev] [RFC PATCH 0/4] dm-default-key: target for
 filesystem metadata encryption
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
Cc: dm-devel@lists.linux.dev, Israel Rukshin <israelr@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Adrian Vovk <adrianvovk@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 linux-ext4@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On Fri, 18 Oct 2024, Eric Biggers wrote:

> This series adds "metadata encryption" support to ext4 and f2fs via a
> new device-mapper target dm-default-key.  dm-default-key encrypts all
> data on a block device that isn't already encrypted by the filesystem.
> 
> Except for the passthrough support, dm-default-key is basically the same
> as the proposed dm-inlinecrypt which omits that feature
> (https://lore.kernel.org/dm-devel/20241016232748.134211-1-ebiggers@kernel.org/).
> 
> I am sending this out for reference, as dm-default-key (which Android
> has been using for a while) hasn't previously been sent to the lists in
> full, and there has been interest in it.  However, my current impression
> is that this feature will need to be redesigned as a filesystem native
> feature in order to make it upstream.  If that is indeed the case, then
> IMO it would make sense to merge dm-inlinecrypt in the mean time instead
> (or add its functionality to dm-crypt) so that anyone who just wants
> "dm-crypt + inline encryption hardware" gets a solution for that.

I we merge dm-inlinecrypt, we can't remove it later because users will 
depend on it. I think it is not sensible to have two targets 
(dm-inlinecrypt and dm-default-key) that do almost the same thing.

I've got another idea - what about a new target "dm-metadata-switch" that 
will take two block devices as arguments and it will pass metadata bios to 
the first device and data bios to the second device - so that the logic 
to decide where the bio will go would be decoupled from the encryption. 
Then, you can put dm-crypt or dm-inlinecrypt underneath 
"dm-metadata-switch".

----------------------
|     filesystem     |
----------------------
          |
          V
----------------------
| dm-metadata-switch |
----------------------
      |           |
      V           |
------------      |
| dm-crypt |      |
------------      |
      |           |
      V           V
-------------------------
| physical block device |
-------------------------

Mikulas



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
