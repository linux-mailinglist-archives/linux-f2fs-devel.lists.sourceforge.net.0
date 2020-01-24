Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F414785B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 06:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kXOQJ43uZqpaUqqyIxBM3PO9YtzqIkTXk6rX1FKxot8=; b=Cgwq3dCqqiKPUDp2IBfOfM4hs
	Fnz5PQ4Veg2UvHyunRSQePDlfpsrDWATY8pQQU7qgvGUPfsCk9aq2SfJV9DJfFqbXUs8HomWnUIGz
	2YDoGGz9MpIj4O3ZhSuIfjKIK+t1X/BLL4zdG9i/nCUCj2nZ5rMzUfqYkxczMkEoZPOiI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iurvj-00038r-9C; Fri, 24 Jan 2020 05:54:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1iurvh-00038U-R6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UeJz9jyBNt5yayp7xj4f/SZWo0DpuycvuaFMYq1D8lg=; b=Z00dQG2X+PDUTTCGRUlWpVSL9i
 yHq0t702Iana/N0fw1QJu8/WKqtu5Zx7i7RSmOUvO1He/5Jbe7/zAGzdgMQJI+EvMxCFKlkCLbJ1n
 MBrSdLHpmfOiYsvo3yCHCz+QPIeERD1B35Ron3r5I6xytI2+Swf6XJUtdeGUdJe0yFME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UeJz9jyBNt5yayp7xj4f/SZWo0DpuycvuaFMYq1D8lg=; b=MRRkZFp+//7abK1su4zeQ1x8j2
 5s6Npzf1CO/xeTpUnP6p3kgUOs02VV+TADI9DSszFl3t5sdh0oJB2/dwCY102EGUdoHHwnUsHsFjl
 islodknXJtjpxuaYjq5u2xsJLxVuF+D0xoYFNFbRtlYmIrusOp4L4rg5Enh64wkR8cE8=;
Received: from sonic314-21.consmr.mail.gq1.yahoo.com ([98.137.69.84])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iurvf-003Jr4-MF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1579845286; bh=UeJz9jyBNt5yayp7xj4f/SZWo0DpuycvuaFMYq1D8lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=KGsVaRm92ZxxNl+FfyKr9wtDg7H7TiVu0Hhui3zuhNcA1t7KmNixs1e78tp8OZrhX+o0mZsRWdsEFV8MHH1VMrSKhrIF747+f5neYNRobRasQHUvemAEGe6fdyHIQNr+rmp4jfIszKDWaXK2YIuArPgeWnq79x13D/roedNAVmG8YZw9SAhh2k3uRPdHcU+ksg4/FmWJ2M1QO9oj0ozEkhe5oG69VMTtjaPBgPQjfOXtFLvTI8pkwdbbZZGF6xIwTO8auOjPZeypae/8X7hBUS/xvk1U2qIl4ydJUzBDbztsmNzMoM2VJp+Z0LpauqqIPqp/vixM7Tm2ldm5EdyGDQ==
X-YMail-OSG: jpBgorYVM1niDtoaJJkIHlAQwijPN.6fSmZoI4.D5pZpqmPkPgbrgdCc3bajoGE
 9NFLvAJZlQp9e_slnmrybNZnRd7.xfJeiO6p85yik1XdVrNwNPhSm7jC9gCYQpbQ1MkUkVhqXlP8
 CbEPhu4VEYevwxrsg6VN3Rpigk9xLiQ0ucRw.WZKNCtGQ_AkCTxq_fYq_ss8sbV.95yBQIXJ0RSE
 zRDQNhHjjg.aO7x1BBPbsgppivpLGEgOiP7lO9Z.lhCBjTtlCBAVap3b1O1SDS1bjkBV8phceVDM
 nFcv_4kWg4jLu8D.dxw_dzp_fyrhpnFP.AFhMPhf_hhugMfXrsiPdNzfoREF07wZDwdbuPOML59U
 Oo7RuXpvNk6UbxfDveVZFmJHvf1oaNZGMjrZcOaGq0E6mUW45Op3kBteRJ.Syn1W.FigWSPEMjbl
 OmdiDgOaJ2ExqCMAvX9L_99nm25IX76gES9xIONRNAu.vzQsrhtppRKnGUS9YiZ3IvX6CndPC2.F
 0wvZIz9aW8HHlg7FUPmiplPN91NmJrJ6aPO1noqJQSTV23HC38nDaMllXTr_GkK7TGnc94flHjou
 zwP0NLw8Sw_ajvTHDXIOSE4nKr08X0bJ8rqqwOl_HgHcte4Zoi1ZJqvUSiKA1UYOW27wzv8lcyrK
 e1WNg9KWHpUZHamY4taOgz8.8XNJ2F_i5RH4PapB4xFfr8cw9bAySh9Bkpy4VROqymI7I7JPY00q
 Iyy7E.wWJfM8ch.37t2vFxAqcqqm1PMlcXfeBQl9TFfNLq6cAKRZWsr8oNGp4HlJHApqOaFm1.Q4
 8RNzJwUqJ87Crb3sx0unDxhoHpV6AiXotap4dvQmv_f7aLd0GrG5hUccDlTdPCEklvQeP9nIEZqv
 OPy6RwATC6wnGkKQseChbiXzfsybZbyNpXc6tfzCjki99l23c44E9ukJdbDmWKNQ95ga73oghi.I
 97wQS8b3Vz9_x5Eh6yqw55CUvejzxvwFeM8DH4cskesjYGhgQQb2Vjr.AiPZeOu5d8umJZjTZG3g
 mcuTqSUCqRUF5C62h4Khc9AWYp57Mr59cTTFXwlCrSyYJFEp9l90dhncXdL4S.26.0SQ0vJvKhBZ
 X3BpqbjCVSdFOhNyzOnCp2_BrmCagUDAUATKCuedlydlI68tUQ_OkkkIHvOqoXSAO7meALGjHMsP
 OMISiC2VQSlwwKmGIDOFLJsDqTl6SLV1vDZ2r1nALsat6ul2TGkpmvM_q9AGMorgiS3LRghQWAvI
 z4EhmII8xNvwUT8cxPFrX06Yhfll.WNp7qiY6pMIb_ZkuZLaHhKochdff.I9l8U6QToEgzG0AEKD
 X1nwNxGlfh5jUxtNLWD267If67nf456b57TzIDkE1KOIbHMfgw4SLofRbwDWkPsZglTDkBaBnCWr
 1advyz4RlnpkNGQ9QV.pBaXmwhD6r72hh8fiCGsLBbA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Fri, 24 Jan 2020 05:54:46 +0000
Received: by smtp432.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 5154e0a93daa76c8f17f548eb900f9b7; 
 Fri, 24 Jan 2020 05:34:30 +0000 (UTC)
Date: Fri, 24 Jan 2020 13:34:23 +0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200124053415.GC31271@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200124041234.159740-1-ebiggers@kernel.org>
 <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124051601.GB832@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124051601.GB832@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.14873 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.69.84 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iurvf-003Jr4-MF
Subject: Re: [f2fs-dev] [PATCH] ext4: fix race conditions in ->d_compare()
 and ->d_hash()
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 23, 2020 at 09:16:01PM -0800, Eric Biggers wrote:

[]

> So we need READ_ONCE() to ensure that a consistent value is used.

By the way, my understanding is all pointer could be accessed
atomicly guaranteed by compiler. In my opinion, we generally
use READ_ONCE() on pointers for other uses (such as, avoid
accessing a variable twice due to compiler optimization and
it will break some logic potentially or need some data
dependency barrier...)

Thanks,
Gao Xiang




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
