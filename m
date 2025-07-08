Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA397AFDB8C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 01:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NgeMaEni3xFyNQvdpkyhGILLiCYEn5jrIZz1yysfsg=; b=X9vA0ErJ/qfXGsUgopzGNNby9t
	YMw/5e1/wiCyt6QHE86LPcgxF0ZPtWlvfnxMTknJZ46DYycIK+FmWidQ7aGTjMWDXwkS4xI/3NaME
	H8L0recQOYdZMsNRJhyhEM/g18Qr5rm5BZjr2ZLZfRERbYpSLrK/BP6SHgBpZRlXfUdw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZHPu-0002C3-LO;
	Tue, 08 Jul 2025 23:08:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uZHPc-0002BS-M9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 23:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cCQMtvwE0mNayWpvuapXEW0romZ3tVtpbG7Lv3AsWFA=; b=NYLbLJWEtjZ5gCHAbvQFZRi2AF
 65fv6K1St9lXpPF92HSkxNb2ZbmJrRZlvC47hKeJcwETCERVY1T+ZAzMhG6i8FKDx7SGIhYIEUOo3
 luCV9QtWT0Zw8ZWRYf2iJOf+ar7EC6RMHQUcL9QtcUiiJMCGpHeHdgKTVtTKHzNUwXtw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cCQMtvwE0mNayWpvuapXEW0romZ3tVtpbG7Lv3AsWFA=; b=ZOPD5DLqMBqqUzdUcp8s/5Ncxr
 LR24bSbf/NckncMIGy21hWqq1TqeSLK+C24nFwPENYRLWFavFnjp6L8OoTi/IZ3LbQybru85i1bIv
 UVdDAgeEoeuOA23aNT3q1GZ0ZT/Wsq49l4rnnWOvnDIhHThG//0z+rUhSKDMrX7akUtY=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZHPb-0007p4-Sr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 23:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1752016034; x=1752620834; i=quwenruo.btrfs@gmx.com;
 bh=cCQMtvwE0mNayWpvuapXEW0romZ3tVtpbG7Lv3AsWFA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=i4pf8EKFeIoWpfqPsXZYMyeE+6T+whwPw5w9rP+mHZIjCu0oiaSG4bXrGEU98aNI
 on0B0J1cMyD2aADLMytxit8sb7aWDpc0OB4aBwHB/CP3Y7OuBNRilOgL2CUDpKgqs
 bijoJUjohZ+w5NE+PUqx5LtoCzVsdVzZiE34aqY4SkNqe18Vlevum45vhjpqniLyh
 +oNZSUmbJRRN70SBZPPtZ/SF6MGHegO7SRTtVe1fglC0W+W2OrUfW9SzcQkRsu97s
 LZvLfSovA7B9LAdnILsp3dqJ+YEI9h0PkJiSHhsv7DB4OlNxWbPkSaYahmB6KTzTe
 DOz1VR7Kl25vC2/cXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MplXp-1v0LxE17Vd-00fkCB; Wed, 09
 Jul 2025 01:07:13 +0200
Message-ID: <00f5c2a2-4216-4eeb-b555-ef49f8cfd447@gmx.com>
Date: Wed, 9 Jul 2025 08:37:05 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Chinner <david@fromorbit.com>, Christian Brauner <brauner@kernel.org>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
 <aG2i3qP01m-vmFVE@dread.disaster.area>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <aG2i3qP01m-vmFVE@dread.disaster.area>
X-Provags-ID: V03:K1:paNGj6ylr6iQz3ydUbolGyyQuT3DFdLzYnRgrgGXO6m3nvNy43S
 TawhOSazFwGac1Ie3E+Vp60tp3UZ9Y2leLV1unV5bBcg8XKx6AA6TXH1TD7/BEzhwPBEdBB
 vavDNJMLbiNdhECLKgfaSuY/D93lTIrVazjpHNN+vgxnj+bX43jJaYP4uenge5hjTuGCnlw
 spiCSNHw1yGS3XjigN7qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vDqChiyReGA=;EBS2Kh860vT4bMlBx37uQgO01Vy
 Th+Uc9OeRV30yN28K0WJsI7uW+2yHTaqLAvRf9Ia+e1JT+zhGAR5CBTPb5X7IABrTBEDK9MaB
 JIyxSj1nPmmcubJ+fiZKWBio6on/jQg8DcwlH46JbBVPjfB/QUHhpjDY+xeejWBCHDeqwX1fG
 qvJjw2rbU3wmsqrgUMKi0m9ZzFt5zMPrE9QmsuAfJtzoq7wpfz3A5MyrGjEqEMJskWc6bGaVG
 i6FXqSDAi5C0/bFhMCzYKaMh86iogT0O3AviRCrE/wqCiqrYSysvnnakOkoWvmw0dCu/JkSeo
 suMXIEZ46AQK7hc1veB2aFoUiFeHxXGddVeXakxOYfXe7DRLYHMLZ92S1c/bXNgmuwumpXvYG
 Eo31wbvdzJAdFNkDG6cGHLLDAdlI1agRdvqOTebYi2H+yXub4LPpANXmxSX0YNNBiOcQTwyZ8
 U3mF1YPt96kGEeNUPAyvHmHtgNe+eArJ9TeguXV7bUL7GdSLmYlFeqLQJ16Fu13Y6EP9M5xpg
 h4Wwxb/b1MUYCY63AaoHY4VRUzjf7xFCqgjFkMMGopd/m/gp7V9Lk1crM2CtEL2EGch888AfQ
 Q7pYb5QgLxAM0Gklc/zXyU2XnZ1WIhIYlnYeS5gXYCQwUrFsmlXNDNfy08hna0U52Oso9bMyn
 rrcbxpcENaykYKOEyS3u2S/aBRTDhtGOvSvU+tvp+btvoi+6AV3EDSvEhWjjMYj5k8l38WxYD
 +XcYtl81SJuZh7Q/nz5PmxfzlWqg7zz7CL5ezKNZRnY92mIDcXgzLD4oikHl3CoRL1DRIwIFa
 fN1xhdskn8cD9ZnbSWejR5JsvyWxSFUzj2t576jJXXyEnqLdjlGUJggEFZotWP3vGJSBdmGn5
 5Y7LTVxVfd+UVzfdiBxgSkSsEZRl72pOtJbnNxLuFuYC09IdU9SzLWg/wH2FcFfdoZE9nBOJs
 hj9ZHQVFIcAABqn1jTEP4vg87w5548hPZ4eGStflyiux4wg6qQJfE82T1lQ2A0OS+Yk2wz3RP
 VBU9aQiR0E9qUz2QoxkR444fjMPbjyjYmvyt9yKghIwNKahpHCUXe2+XEcyRVieiAjzA92w6H
 jqZo+KbUbZcbctL5xXA0eQARxOf9IfAFI6lSCMFBB1GPl9rCOaLWVRhqhRZkc+cNzD8DgGy7n
 4jRiZQMpizrJFbNE7gF2brvufr6JZsZ2i2cLSzXUm/ktEjqBpO4UanuMTyRB1V1vVN/GMAJZy
 vjzQzAwT2GLRDfI3OSl6dtx2VBT1hPKDs8WAvlSPBNmW2kmWet49sjfAS6awnV/zA7dlKFXyW
 F4uaFs2x1Itcl0pFZsjsD7XyIyIcpuThT9h4Z5n7wandsOMsC1fwrs4ydxVzJu8MlIa+LweT1
 cWrr5zCAEi0/YI5r6OXtMmSnzYANjm2dGcOCCZJUZ0uC4qltsdJGOdHNXzt/H6zMfp/137WFU
 on5uI3kw3fJpOqKF+bmpp0wevULESYl3IXLVUhHGk3W4gml55gXlSHObmmY6hwf3e9n9ZWrdN
 UrosKmypRX/4p3iobzqZnmedcyQ/vW7Rb0aJqS566YuBAzX89TvX7vM02fDe/BsKJQCbuXKjW
 i9tFduQDD9PE7mYJSwZKcBu08Cuu4nqV1Raigwna72w7Q1nYPS2X26Up0HG5Ns17qzED/PYII
 ePr9hjRKbhzCpboe4ci/SoKT5DVAwOYAFIUdjTp7SsVpzd8MtmM2XZwIg4tEr/LUnQ2wY5N1K
 VuTr/e9Gh42bVthNIOwdu4P66qt5B1IQf6tLWw4pfQEOXSu1pputTtiZK4SDl/C1yBQLMkFe+
 0bsaBVqcW7rN7lMdAawkrW72MJeAIKbOh21RTjtFlG+1hVr/lg2hJkpX5A5Exsl4VQhCoZaig
 FgiBpWYQYVjIcIMfppfPyqQeg2OoqLDSgB31Qz9tz6gm2KQyDbAcaWHOhz3ZKucBunGlOnsXL
 jfCzY4akNkimKIpNiuvHxBat18ZAYZgorJNgDKfEF/KGMe1dD/uKAbqLYQhKYUqQAqv6Nj71o
 HI/PfYYfspy18kvBzaoc3GzQrAZBrYOelIg4bdTpRye5pLkH73FjuL3obcBBmFPmX9KDrU3om
 uM5KVy8U1y8VN3+k+GIK3a8wMJ7Cp6KSfaRWQJckLiOBeQ8t3xVGYXFRd5/rAjB+uo0udCbAV
 dQAfUGAEvIoV4/dpVjInNhFzt9Sypsgq/E9AZBYOgVitNWVOJ8myz78ZaBJCqCMlrGudpmdST
 2onCVCW9VOmUwc3/gBNIHH64FMW1z9vlgRX5cqgUocB8MueMGprBtYZyrNMFO8RmoZkIrCsbD
 tZdoATiJjJUgCfskb3+dLhhWt1O6fsM+7M3OIVWmJQaWva9i/P7KiBiF3BhV8dNyI+uD+lUK6
 bPVmiXejG5RRztI0cJ0lxfk7dic5hlrTLCn5CoGjHUrKzg/svTCLpMbULS7FrFQfo7JUUD5op
 0Uty47N57pmL55xQkoP6pROfV7cQUl4cR5JScXTu+53YcFCOuqvOp/tBGXrm+BWoi9jCkd9ot
 MZ2OtOe8f71yGjxxDwbWO25tUTpxPk5PY0GCNsiFDsInQDajdHHDAeXHLXl6IiCQ5lok4PPMQ
 wWKNkMaWIHpzcH/Nr5jnRwBX9c76NKcNPBt2XpQdZ7YQ6k8RqgFuB2Q9CYrXP42t6G6lRUUiR
 pzp5I1/bIYepO7/bTI2KaACoGEozEUPE9F95bY321kjsuxBbCUFx91+W+tVrxeCQECBNdSDmc
 /mnVkdEAKj+rA5NGVJzhc9W7IfoiDkqsWVIltda7e7B5xUND1PAYZuTr8aCTURlt3e+UaqZrM
 vqvZPMemFZNFBaP9aeo6D2xvLyFOd1TG4UDtmeB+Ma7kDyInDaUqrGbySIQuVlZyTTl6PI1fj
 cRYyBxS9VYhfisEUQeBk16b4/VCKvvWOai/0UX5zsNFNUM6aLr0IJbE63Zr0hZ4am5uUkmeOq
 gwpOWm6VU5A96P9UNCeiNUas5ZQC2GqrhaauC8ZCEHh/k8ySQk59xWNK+2qePtgCdBHEN2Zsr
 bbGHg94648CYfdsQ17wHJM62faDnuRI8kevw5s7n6W7vmnbnZEpG1B0vMBjBkyDOuKSRLYzcR
 fl7GvlLeZN4IQQQySoAV+QkmMu2xw71mSxpD+W3aXhVjp61qOoiZQR0WiBXahSjV8MYSXz9Fr
 H+Y87ixMBxagvePRP27GgjAA24P/PCOd2FkCVn+voiYpFRvfoIgztiSxePROQOzPKUSovWqTf
 4QyeBtCaRohA80BMAf8cMRISpAdY1Tc5kKgafISOqxYiarN8woETUvhWp54IXYNx8l7oJ+ASq
 YDLl3jVcwD2XFs2yMXfXKvK1xcNXkht8R0t5d4JZkXfgAYaUvqMZqxc4TjXZosRntIkby+ziy
 dM4O2eI9aWD8rQcm6w/sD+87GMbf31GqVtrvUPN30+Jrw1imErntSkN6nSZM2vb4Si0pM+obU
 r5+WbbMk1GtQwoU/NYacPopJkA7zbMQg=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/9 08:29, Dave Chinner 写道: > On Tue, Jul 08,
    2025 at 09:55:14AM +0200, Christian Brauner wrote: >> On Mon, Jul 07, 2025
    at 05:45:32PM -0700, Darrick J. Wong wrote: >>> On Tue, Jul 08, 20 [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [quwenruo.btrfs(at)gmx.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [212.227.17.21 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uZHPb-0007p4-Sr
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: ntfs3@lists.linux.dev, jack@suse.cz, "Darrick J. Wong" <djwong@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzkgMDg6MjksIERhdmUgQ2hpbm5lciDlhpnpgZM6Cj4gT24gVHVlLCBKdWwg
MDgsIDIwMjUgYXQgMDk6NTU6MTRBTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVuZXIgd3JvdGU6Cj4+
IE9uIE1vbiwgSnVsIDA3LCAyMDI1IGF0IDA1OjQ1OjMyUE0gLTA3MDAsIERhcnJpY2sgSi4gV29u
ZyB3cm90ZToKPj4+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDA4OjUyOjQ3QU0gKzA5MzAsIFF1
IFdlbnJ1byB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4g5ZyoIDIwMjUvNy84IDA4OjMyLCBEYXZlIENo
aW5uZXIg5YaZ6YGTOgo+Pj4+PiBPbiBGcmksIEp1bCAwNCwgMjAyNSBhdCAxMDoxMjoyOUFNICsw
OTMwLCBRdSBXZW5ydW8gd3JvdGU6Cj4+Pj4+PiBDdXJyZW50bHkgYWxsIHRoZSBmaWxlc3lzdGVt
cyBpbXBsZW1lbnRpbmcgdGhlCj4+Pj4+PiBzdXBlcl9vcGVhcmF0aW9uczo6c2h1dGRvd24oKSBj
YWxsYmFjayBjYW4gbm90IGFmZm9yZCBsb3NpbmcgYSBkZXZpY2UuCj4+Pj4+Pgo+Pj4+Pj4gVGh1
cyBmc19iZGV2X21hcmtfZGVhZCgpIHdpbGwganVzdCBjYWxsIHRoZSBzaHV0ZG93bigpIGNhbGxi
YWNrIGZvciB0aGUKPj4+Pj4+IGludm9sdmVkIGZpbGVzeXN0ZW0uCj4+Pj4+Pgo+Pj4+Pj4gQnV0
IGl0IHdpbGwgbm8gbG9uZ2VyIGJlIHRoZSBjYXNlLCB3aXRoIG11bHRpLWRldmljZSBmaWxlc3lz
dGVtcyBsaWtlCj4+Pj4+PiBidHJmcyBhbmQgYmNhY2hlZnMgdGhlIGZpbGVzeXN0ZW0gY2FuIGhh
bmRsZSBjZXJ0YWluIGRldmljZSBsb3NzIHdpdGhvdXQKPj4+Pj4+IHNodXR0aW5nIGRvd24gdGhl
IHdob2xlIGZpbGVzeXN0ZW0uCj4+Pj4+Pgo+Pj4+Pj4gVG8gYWxsb3cgdGhvc2UgbXVsdGktZGV2
aWNlIGZpbGVzeXN0ZW1zIHRvIGJlIGludGVncmF0ZWQgdG8gdXNlCj4+Pj4+PiBmc19ob2xkZXJf
b3BzOgo+Pj4+Pj4KPj4+Pj4+IC0gUmVwbGFjZSBzdXBlcl9vcGVhcmF0aW9uOjpzaHV0ZG93bigp
IHdpdGgKPj4+Pj4+ICAgICBzdXBlcl9vcGVhcmF0aW9uczo6cmVtb3ZlX2JkZXYoKQo+Pj4+Pj4g
ICAgIFRvIGJldHRlciBkZXNjcmliZSB3aGVuIHRoZSBjYWxsYmFjayBpcyBjYWxsZWQuCj4+Pj4+
Cj4+Pj4+IFRoaXMgY29uZmxhdGVzIGNhdXNlIHdpdGggYWN0aW9uLgo+Pj4+Pgo+Pj4+PiBUaGUg
c2h1dGRvd24gY2FsbG91dCBpcyBhbiBhY3Rpb24gdGhhdCB0aGUgZmlsZXN5c3RlbSBtdXN0IGV4
ZWN1dGUsCj4+Pj4+IHdoaWxzdCAicmVtb3ZlIGJkZXYiIGlzIGEgY2F1c2Ugbm90aWZpY2F0aW9u
IHRoYXQgbWlnaHQgcmVxdWlyZSBhbgo+Pj4+PiBhY3Rpb24gdG8gYmUgdGFrZS4KPj4+Pj4KPj4+
Pj4gWWVzLCB0aGUgY2F1c2UgY291bGQgYmUgc29tZW9uZSBkb2luZyBob3QtdW5wbHVnIG9mIHRo
ZSBibG9jawo+Pj4+PiBkZXZpY2UsIGJ1dCBpdCBjb3VsZCBhbHNvIGJlIHNvbWV0aGluZyBnb2lu
ZyB3cm9uZyBpbiBzb2Z0d2FyZQo+Pj4+PiBsYXllcnMgYmVsb3cgdGhlIGZpbGVzeXN0ZW0uIGUu
Zy4gZG0tdGhpbnAgaGF2aW5nIGFuIHVucmVjb3ZlcmFibGUKPj4+Pj4gY29ycnVwdGlvbiBvciBF
Tk9TUEMgZXJyb3JzLgo+Pj4+Pgo+Pj4+PiBXZSBhbHJlYWR5IGhhdmUgYSAiY2F1c2UiIG5vdGlm
aWNhdGlvbjogYmxrX2hvbGRlcl9vcHMtPm1hcmtfZGVhZCgpLgo+Pj4+Pgo+Pj4+PiBUaGUgZ2Vu
ZXJpYyBmcyBhY3Rpb24gdGhhdCBpcyB0YWtlbiBieSB0aGlzIG5vdGlmaWNhdGlvbiBpcwo+Pj4+
PiBmc19iZGV2X21hcmtfZGVhZCgpLiAgVGhhdCBhY3Rpb24gaXMgdG8gaW52YWxpZGF0ZSBjYWNo
ZXMgYW5kIHNodXQKPj4+Pj4gZG93biB0aGUgZmlsZXN5c3RlbS4KPj4+Pj4KPj4+Pj4gYnRyZnMg
bmVlZHMgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCB0byBhIGJsa19ob2xkZXJfb3BzLT5tYXJr
X2RlYWQKPj4+Pj4gbm90aWZpY2F0aW9uLiBpLmUuIGl0IG5lZWRzIGFuIGFjdGlvbiB0aGF0IGlz
IGRpZmZlcmVudCB0bwo+Pj4+PiBmc19iZGV2X21hcmtfZGVhZCgpLgo+Pj4+Pgo+Pj4+PiBJbmRl
ZWQsIHRoaXMgaXMgaG93IGJjYWNoZWZzIGFscmVhZHkgaGFuZGxlcyAic2luZ2xlIGRldmljZQo+
Pj4+PiBkaWVkIiBldmVudHMgZm9yIG11bHRpLWRldmljZSBmaWxlc3lzdGVtcyAtIHNlZQo+Pj4+
PiBiY2gyX2ZzX2JkZXZfbWFya19kZWFkKCkuCj4+Pj4KPj4+PiBJIGRvIG5vdCB0aGluayBpdCdz
IHRoZSBjb3JyZWN0IHdheSB0byBnbywgZXNwZWNpYWxseSB3aGVuIHRoZXJlIGlzIGFscmVhZHkK
Pj4+PiBmc19ob2xkZXJfb3BzLgo+Pj4+Cj4+Pj4gV2UncmUgYWx3YXlzIGdvaW5nIHRvd2FyZHMg
YSBtb3JlIGdlbmVyaWMgc29sdXRpb24sIG90aGVyIHRoYW4gbGV0dGluZyB0aGUKPj4+PiBpbmRp
dmlkdWFsIGZzIHRvIGRvIHRoZSBzYW1lIHRoaW5nIHNsaWdodGx5IGRpZmZlcmVudGx5Lgo+Pj4K
Pj4+IE9uIHNlY29uZCB0aG91Z2h0IC0tIGl0J3Mgd2VpcmQgdGhhdCB5b3UnZCBmbHVzaCB0aGUg
ZmlsZXN5c3RlbSBhbmQKPj4+IHNocmluayB0aGUgaW5vZGUvZGVudHJ5IGNhY2hlcyBpbiBhICJ5
b3VyIGRldmljZSB3ZW50IGF3YXkiIGhhbmRsZXIuCj4+PiBGYW5jeSBmaWxlc3lzdGVtcyBsaWtl
IGJjYWNoZWZzIGFuZCBidHJmcyB3b3VsZCBsaWtlbHkganVzdCBzaGlmdCBJTyB0bwo+Pj4gYSBk
aWZmZXJlbnQgYmRldiwgcmlnaHQ/ICBBbmQgdGhlcmUncyBubyBnb29kIHJlYXNvbiB0byBydW4g
c2hyaW5rZXJzIG9uCj4+PiBlaXRoZXIgb2YgdGhvc2UgZnNlcywgcmlnaHQ/Cj4+Pgo+Pj4+IFll
cywgdGhlIG5hbWluZyBpcyBub3QgcGVyZmVjdCBhbmQgbWl4aW5nIGNhdXNlIGFuZCBhY3Rpb24s
IGJ1dCB0aGUgZW5kCj4+Pj4gcmVzdWx0IGlzIHN0aWxsIGEgbW9yZSBnZW5lcmljIGFuZCBsZXNz
IGR1cGxpY2F0ZWQgY29kZSBiYXNlLgo+Pj4KPj4+IEkgdGhpbmsgZGNoaW5uZXIgbWFrZXMgYSBn
b29kIHBvaW50IHRoYXQgaWYgeW91ciBmaWxlc3lzdGVtIGNhbiBkbwo+Pj4gc29tZXRoaW5nIGNs
ZXZlciBvbiBkZXZpY2UgcmVtb3ZhbCwgaXQgc2hvdWxkIHByb3ZpZGUgaXRzIG93biBibG9jawo+
Pj4gZGV2aWNlIGhvbGRlciBvcHMgaW5zdGVhZCBvZiB1c2luZyBmc19ob2xkZXJfb3BzLiAgSSBk
b24ndCB1bmRlcnN0YW5kCj4+PiB3aHkgeW91IG5lZWQgYSAiZ2VuZXJpYyIgc29sdXRpb24gZm9y
IGJ0cmZzIHdoZW4gaXQncyBub3QgZ29pbmcgdG8gZG8KPj4+IHdoYXQgdGhlIG90aGVycyBkbyBh
bnl3YXkuCj4+Cj4+IEkgdGhpbmsgbGV0dGluZyBmaWxlc3lzdGVtcyBpbXBsZW1lbnQgdGhlaXIg
b3duIGhvbGRlciBvcHMgc2hvdWxkIGJlCj4+IGF2b2lkZWQgaWYgd2UgY2FuLiBDaHJpc3RvcGgg
bWF5IGNoaW1lIGluIGhlcmUuIEkgaGF2ZSBubyBhcHBldHRpdGUgZm9yCj4+IGV4cG9ydGluZyBz
dHVmZiBsaWtlIGdldF9iZGV2X3N1cGVyKCkgdW5sZXNzIGFic29sdXRlbHkgbmVjZXNzYXJ5LiBX
ZQo+PiB0cmllZCB0byBtb3ZlIGFsbCB0aGF0IGhhbmRsaW5nIGludG8gdGhlIFZGUyB0byBlbGlt
aW5hdGUgYSBzbGV3IG9mCj4+IGRlYWRsb2NrcyB3ZSBkZXRlY3RlZCBhbmQgZml4ZWQuIEkgaGF2
ZSBubyBhcHBldGl0ZSB0byByZXBlYXQgdGhhdAo+PiBjeWNsZS4KPiAKPiBFeGNlcHQgaXQgaXNu
J3QgYWN0dWFsbHkgbmVjZXNzYXJ5Lgo+IAo+IEV2ZXJ5b25lIGhlcmUgc2VlbXMgdG8gYmUgYXNz
dW1pbmcgdGhhdCB0aGUgZmlsZXN5c3RlbSAqbXVzdCogdGFrZQo+IGFuIGFjdGl2ZSBzdXBlcmJs
b2NrIHJlZmVyZW5jZSB0byBwcm9jZXNzIGEgZGV2aWNlIHJlbW92YWwgZXZlbnQsCj4gYW5kIHRo
YXQgaXMgKnNpbXBseSBub3QgdHJ1ZSouCj4gCj4gYmNhY2hlZnMgZG9lcyBub3QgdXNlIGdldF9i
ZGV2X3N1cGVyKCkgb3IgYW4gYWN0aXZlIHN1cGVyYmxvY2sKPiByZWZlcmVuY2UgdG8gcHJvY2Vz
cyAtPm1hcmtfZGVhZCBldmVudHMuCgpZZXMsIGJjYWNoZWZzIGRvZXNuJ3QgZ28gdGhpcyBwYXRo
LCBidXQgdGhlIHJlYXNvbiBpcyBtb3JlIGltcG9ydGFudC4KCklzIGl0IGp1c3QgYmVjYXVzZSB0
aGVyZSBpcyBubyBzdWNoIGNhbGxiYWNrIHNvIHRoYXQgS2VudCBoYXMgdG8gY29tZSB1cCAKaGlz
IG93biBzb2x1dGlvbiwgb3Igc29tZXRoaW5nIGVsc2U/CgpJZiB0aGUgZm9ybWVyIGNhc2UsIGFs
bCB5b3VyIGFyZ3VtZW50IGhlcmUgbWFrZXMgbm8gc2Vuc2UuCgpBZGRpbmcgS2VudCBoZXJlIHRv
IHNlZSBpZiBoZSB3YW50cyBhIG1vcmUgZ2VuZXJpYyBzX29wLT5yZW1vdmVfYmRldigpIApzb2x1
dGlvbiBvciB0aGUgY3VycmVudCBlYWNoIGZzIGRvaW5nIGl0cyBvd24gbWFya19kZWFkKCkgY2Fs
bGJhY2suCgpUaGFua3MsClF1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
