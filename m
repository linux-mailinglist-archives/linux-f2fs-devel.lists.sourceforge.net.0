Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A2526A70
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 May 2022 21:36:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npb5P-0000JZ-7h; Fri, 13 May 2022 19:36:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tytso@mit.edu>) id 1npb5O-0000JT-M1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 19:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RFt/bdE39UxhuNW6KN2/50ftQSyeSKm2UXzuQnUBf6c=; b=D6mO6YrrlPEeKfsFjgYGf79j1x
 N7sMWcIOyUCHIZ/ONqPielaI5z3WEvPcWGjWEdWMpZRwdva4PZOq+p2FfKMx9y+AHckylMQ5i6334
 SghH/lbAl25XAV/Zxei6CGgZhXcX5xS9l8epsWMRhcBN/PC+W6N0ER5K/GmmxrqXmxRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RFt/bdE39UxhuNW6KN2/50ftQSyeSKm2UXzuQnUBf6c=; b=fsN65nBvyR2tQrlJo4I/q3DAFe
 tCG/I+1m4X2tUgOqpXb3KeVU+UHH2drQXkeT0mgwuoz0k9uqeJXDjZnKuSlK5r69msgOngu06TSDi
 QPYwk5RUuSzApQqcMiG5wBjRkA9810DE/IExXOi1GRjMICjncHiBb01cX2wwOfOn0440=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npb5H-00BDkw-KW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 19:36:24 +0000
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 24DJa5h0007144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 15:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652470567; bh=RFt/bdE39UxhuNW6KN2/50ftQSyeSKm2UXzuQnUBf6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nBB5W9uTLiDNXGXO+dcD5KS8qamuZANEZlRovaHg5ckMjYDDWRHrYXcjz25k2Csnv
 TFDZSoBwqUblsQFnnDJBo5Wz+P2ExAEqHSCrKavRhUh0CaSmG2UfJTCzCV6ohmZCjA
 OCQ/ReLDj6BmfFUddb4qCtTv9AKpn9IvrCFTVVylVwf0zJnzNTBLplZQB8rWwzRTDS
 /hgbC7RHdFPnsPOkivMWitoN66rgViLcIT0C3gEfTGwYqziViGsA/ifTYZ9JpSEZIe
 EHXq2Qk1xBEEJ1L4DkPZBGnXaV/HBVavxzxoF05Qi4F1jfluuS1sUN5xwrMwemyV65
 heJqxuGVIG2oQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 164D815C3F2A; Fri, 13 May 2022 15:36:05 -0400 (EDT)
Date: Fri, 13 May 2022 15:36:05 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Yn6zJR2peMo5hIcF@mit.edu>
References: <20220501050857.538984-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501050857.538984-1-ebiggers@kernel.org>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Apr 30, 2022 at 10:08:50PM -0700, Eric Biggers wrote:
 > We can either take all these patches through the fscrypt tree, or we can
 > take them in multiple cycles as follows: > > 1. patch 1 via e [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1npb5H-00BDkw-KW
Subject: Re: [f2fs-dev] [PATCH v2 0/7] test_dummy_encryption fixes and
 cleanups
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Apr 30, 2022 at 10:08:50PM -0700, Eric Biggers wrote:
> We can either take all these patches through the fscrypt tree, or we can
> take them in multiple cycles as follows:
> 
>     1. patch 1 via ext4, patch 2 via f2fs, patch 3-4 via fscrypt
>     2. patch 5 via ext4, patch 6 via f2fs
>     3. patch 7 via fscrypt
> 
> Ted and Jaegeuk, let me know what you prefer.

In order to avoid patch conflicts with other patch series, what I'd
prefer is to take them in multiple cycles.  I can take patch #1 in my
initial pull request to Linus, and then do a second pull request to
Linus with patch #5 post -rc1 or -rc2 (depending on when patches #3
and #4 hit Linus's tree).

Does that sound good?

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
