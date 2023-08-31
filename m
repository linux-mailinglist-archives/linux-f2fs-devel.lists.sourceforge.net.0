Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3FF78E734
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Aug 2023 09:30:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qbc8j-0006xO-EW;
	Thu, 31 Aug 2023 07:30:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michael.beutler@tanarotla.com>) id 1qbc8i-0006xI-Qy
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NwGZ/McUBhbrX4yj4evr41zGI0Xgn6o+z/fL++USvl0=; b=Kz1qsLAgX2OUdue34x56rJG91l
 lD3oSj0pUxuxXNfC3F0TinNQWT49q1+dAD4STbpSJuxpBKDm+KQjyrfYdwnL07rtmKcEl7rBeRgPR
 RlmZL7fIUy0LnHMLxihWhshpoBHAc+818CQTyZullc2nQaNmQPi2M7r47N+yqc7yvVwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NwGZ/McUBhbrX4yj4evr41zGI0Xgn6o+z/fL++USvl0=; b=Q
 J7xMmls/AAzoIjfwhaVEKTnNgQ0HuyyIkwOBJ2MtAa+/hIKVtYPqNdnlG9DRU5YkzTrjeMUNZh1yr
 7kmXviDQm8dksIUcFn9foUsJvDS7xXdW5AQ5Wf72mtVMbcpAqhyjazFEOAzlMXXahx+dAT3tW9j5y
 J3MgVnFL6C+KBnSc=;
Received: from mail.tanarotla.com ([79.137.80.196])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qbc8i-0002Oy-6R for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:30:53 +0000
Received: by mail.tanarotla.com (Postfix, from userid 1002)
 id 6EE44236A6; Thu, 31 Aug 2023 07:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tanarotla.com;
 s=mail; t=1693467037;
 bh=NwGZ/McUBhbrX4yj4evr41zGI0Xgn6o+z/fL++USvl0=;
 h=Date:From:To:Subject:From;
 b=EOtvQlKKMR0OmRFJZRdCNtLM+O1nCfiFWprpMzffuCFao61bO7LtqEHa+97wZSBYq
 eoYKvHbyqKysBD/6nCNu7YQa2310a+SEbfDegXwPNqW2/kdzj3N6GI0wOLLGPBD1XE
 OeiKMHMQ4ML8M4ScMqggGeQTs+ghXkPviru/AmKeo6Bn9YYMCwLeIFgsVPBnuMhT8e
 YmsbfBh/ibK/9hmRKWyUY8MP5IkEGiHv/0qvkdeio6BWN/Vz9tByNg1SOx2s7xJFgW
 O63VIHnXaQgkqK27FuM/TmDyQIXcNvivo5+D0lZmKzTKyG1a0AbK2g+9TpTD3LUfdp
 ktWIoyLyGvTng==
Received: by mail.tanarotla.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Aug 2023 07:30:32 GMT
Message-ID: <20230831064500-0.1.18.2qsv.0.p7ib051c4e@tanarotla.com>
Date: Thu, 31 Aug 2023 07:30:32 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.tanarotla.com
MIME-Version: 1.0
X-Spam-Score: 5.9 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I would like to reach out to the person responsible for
 marketing or sales in your company. For over 40 years, we have been producing
 attractive Point Of Sales materials that help our international Partners
 to win more customers every day. 
 Content analysis details:   (5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 URIBL_DBL_SPAM         Contains a spam URL listed in the Spamhaus DBL
 blocklist [URIs: tanarotla.com]
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [79.137.80.196 listed in zen.spamhaus.org]
 0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
 blocklist [URIs: tanarotla.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qbc8i-0002Oy-6R
Subject: [f2fs-dev] Custom-made displays
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
From: Michael Beutler via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Michael Beutler <michael.beutler@tanarotla.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

I would like to reach out to the person responsible for marketing or sales in your company.

For over 40 years, we have been producing attractive Point Of Sales materials that help our international Partners to win more customers every day.

Thanks to creative and unconventional designs, sales of products of various companies increase on average by 35%.

If you have space to service new customers, I will be happy to present what we could do for you. We can talk?


Kind regards
Michael Beutler


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
