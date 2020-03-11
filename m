Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD68D181676
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 12:02:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBz7l-0003fa-9A; Wed, 11 Mar 2020 11:02:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1jBz7i-0003fQ-5H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 11:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kjmfxj7Tv15/nFpfaXnaGf8uAzheW1BwYzvh2yNtPHw=; b=b2E/0fO/iOTmmqZRqIZWMSeld+
 gdy0K/j+LNyP68iXTT3e3+ym1vRiDAODCNT0VyjTo1kqlCKQpf4I1B5zr9Ajrc7yY7fURDv03DZCb
 x9yToObJDMwiwzsRVg4PSFJGnCxuDmJSZUTr6fioS2YWpRrIbmvBVxx0ZjuO8JobOnzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kjmfxj7Tv15/nFpfaXnaGf8uAzheW1BwYzvh2yNtPHw=; b=fbSZCIzP3F+pAZ7PvFGOqh4O35
 LdhStNm1VEKFhOvxkbLYcULifEyrdAfmcwH3dAW9ACCpAdfVPE+KtavGEqDBUj/v7T2xvHlHziCqo
 HqBGxRo4hwGeSc4/bFg5E6Uz68GZL312rKH9YU5IXrV0rqNdl4Zl0u5a3KWZGRmZuqck=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBz7g-00FVQ6-DR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 11:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1583924511; bh=P6XGe2Y/JfrAmfvHCCn6nLtRPNSYzKFV+VBM9UgB3m0=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=q1gWRADYxD/Lk+gYf4sKqAypi6n1psX3dYNFQY3jPlM1bX1aGg2FX2aR8js7PijZg
 vyfv2Qd3hOrxpv/6cp3zTHZLE+lSj1rHGQMKVQe7jgBg72Dh/JrbsEbQrn/qrA6Kmx
 r4G7Y0H4P2aIo8QDBjUgBBIxsHLRPconvVLPQTqE=
Date: Wed, 11 Mar 2020 12:01:50 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200311110150.ajywqttf7pyrpnau@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20200225120814.gjm4dby24cs22lux@core.my.home>
 <20200225122706.d6pngz62iwyowhym@core.my.home>
 <72d28eba-53b9-b6f4-01a5-45b2352f4285@huawei.com>
 <20200226121143.uag224cqzqossvlv@core.my.home>
 <20200226180557.le2fr66fyuvrqker@core.my.home>
 <7b62f506-f737-9fb2-6e8e-4b1c454f03b2@huawei.com>
 <20200306120203.2p34ezryzxb2jeuk@core.my.home>
 <0ce08d13-ca00-2823-94eb-8274c332a8ef@huawei.com>
 <20200311103309.m52hdut7mt7crt7g@core.my.home>
 <c3d53657-7c2a-9d2f-9111-048db6e30a7e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3d53657-7c2a-9d2f-9111-048db6e30a7e@huawei.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jBz7g-00FVQ6-DR
Subject: Re: [f2fs-dev] Writes stoped working on f2fs after the compression
 support was added
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 11, 2020 at 06:51:23PM +0800, Chao Yu wrote:
> Hi,
> 
> >> Oops, it looks previous fix patch just cover the root cause... :(
> >>
> >> Did this issue still happen frequently? If it is, would you please apply patch
> >> that prints log during down/up semaphore.
> > 
> > Not frequently. Just once. I couldn't afford FS corruption during update,
> 
> Alright.
> 
> > so I reverted the compression support shortly after.
> 
> What I can see is that filesystem was just stuck, rather than image became
> corrupted, I guess the condition is not such bad, anyway, it's okay to just
> revert compression support for now to keep fs stable.

Yes, to be precise, file writes were not completed and fs was stuck.
The system as a whole would probably become unbootable if this would
happen to core libraries necessary for systemd, or something like that,
but filesystem itself was not corrupted.

Re-writing the files was enough to recover the system.

I guess we'll see if there will be more reports after 5.6 is released,
or if it's just some quirk in my system.

I'll try to collect more information, once I'll have some time, to
get to the bottom of this.

thank you and regards,
	o.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
